import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/backup/google_drive_backup_service.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'backup_providers.dart';

enum GoogleConnectOutcome { cancelled, restored, noBackupFound }

class GoogleConnectResult {
  const GoogleConnectResult(this.outcome, {this.accountInfo});
  final GoogleConnectOutcome outcome;
  final GoogleAccountInfo? accountInfo;
}

class BackupController extends AsyncNotifier<DateTime?> {
  @override
  Future<DateTime?> build() async => null;

  Future<bool> backupNow() async {
    state = const AsyncLoading();
    try {
      final db = ref.read(databaseProvider);
      final backupData = await _buildBackupPayload(db);

      final success = await ref.read(backupServiceProvider).uploadBackup(backupData);
      state = AsyncData(success ? DateTime.now() : null);
      return success;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<void> restoreIfNeeded() async {
    final db = ref.read(databaseProvider);
    final hasLocalData = (await db.select(db.users).get()).isNotEmpty;
    if (hasLocalData) return;

    final backupData = await ref.read(backupServiceProvider).downloadBackup();
    if (backupData == null) return;

    await _restoreFromPayload(db, backupData);
  }

   Future<bool> restoreFromGoogle() async {
    final db = ref.read(databaseProvider);
    final backupData = await ref.read(backupServiceProvider).downloadBackup(); 
    if (backupData == null) return false;

    await _restoreFromPayload(db, backupData);
    return true;
  }

  Future<GoogleConnectResult> connectGoogleAndCheckBackup() async {
  final service = ref.read(backupServiceProvider);
  final account = await service.signIn();
  if (account == null) return const GoogleConnectResult(GoogleConnectOutcome.cancelled);

  final backupData = await service.downloadBackup();
  if (backupData != null) {
    final db = ref.read(databaseProvider);
    await _restoreFromPayload(db, backupData);
    return const GoogleConnectResult(GoogleConnectOutcome.restored);
  }

  return GoogleConnectResult(GoogleConnectOutcome.noBackupFound, accountInfo: account);
}

  Future<Map<String, dynamic>> _buildBackupPayload(AppDatabase db) async {
    return {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'users': (await db.select(db.users).get()).map((u) => {
            'oldUserId': u.userId, // guardado só pra religar FKs no import, não é reusado como PK
            'name': u.name,
            'email': u.email,
            // password propositalmente omitido do backup — segredo local não deve viajar pro Drive
            'height': u.height,
            'weight': u.weight,
          }).toList(),
      'activityTypes': (await db.select(db.activityTypes).get()).map((t) => {
            'oldActivityTypeId': t.activityTypeId,
            'title': t.title,
          }).toList(),
      'virtualPet': (await db.select(db.virtualPet).get()).map((p) => {
            'oldPetvId': p.petvId,
            'oldUserId': p.userId,
            'name': p.name,
            'life': p.life,
            'level': p.level,
            'points': p.points,
          }).toList(),
      'activities': (await db.select(db.activities).get()).map((a) => {
            'oldActivityId': a.activityId,
            'oldUserId': a.userId,
            'oldActivityTypeId': a.activityTypeId,
            'title': a.title,
            'date': a.date.toIso8601String(),
            'time': a.time,
            'points': a.points,
            'description': a.description,
          }).toList(),
      'skills': (await db.select(db.skills).get()).map((s) => {
            'oldUserId': s.userId,
            'oldActivityTypeId': s.activityTypeId,
            'title': s.title,
            'level': s.level,
            'currentProgress': s.currentProgress,
          }).toList(),
      'goals': (await db.select(db.goals).get()).map((g) => {
            'oldUserId': g.userId,
            'weeklyWorkoutTarget': g.weeklyWorkoutTarget,

          }).toList(),
    };
  }

  Future<void> _restoreFromPayload(AppDatabase db, Map<String, dynamic> data) async {
    await db.transaction(() async {
      // mapas de tradução: ID antigo (do backup) -> ID novo (gerado agora pelo autoIncrement)
      final userIdMap = <int, int>{};
      final activityTypeIdMap = <int, int>{};
      final petvIdMap = <int, int>{}; // sem uso direto ainda, mas mantido por simetria/futuro

      for (final u in (data['users'] as List)) {
        final newId = await db.into(db.users).insert(
          UsersCompanion.insert(
            name: u['name'],
            email: u['email'],
            height: Value(u['height']),
            weight: Value(u['weight']),
            // password fica null — usuário não tinha senha real nesse fluxo local
          ),
        );
        userIdMap[u['oldUserId']] = newId;
      }

      for (final t in (data['activityTypes'] as List)) {
        final newId = await db.into(db.activityTypes).insert(
          ActivityTypesCompanion.insert(title: t['title']),
        );
        activityTypeIdMap[t['oldActivityTypeId']] = newId;
      }

      for (final p in (data['virtualPet'] as List)) {
        final newId = await db.into(db.virtualPet).insert(
          VirtualPetCompanion.insert(
            name: p['name'],
            life: Value(p['life']),
            level: Value(p['level']),
            points: Value(p['points']),
            userId: userIdMap[p['oldUserId']]!,
          ),
        );
        petvIdMap[p['oldPetvId']] = newId;
      }

      for (final a in (data['activities'] as List)) {
        await db.into(db.activities).insert(
          ActivitiesCompanion.insert(
            title: a['title'],
            date: DateTime.parse(a['date']),
            time: a['time'],
            points: Value(a['points']),
            description: Value(a['description']),
            activityTypeId: activityTypeIdMap[a['oldActivityTypeId']]!,
            userId: userIdMap[a['oldUserId']]!,
          ),
        );
      }

      for (final s in (data['skills'] as List)) {
        await db.into(db.skills).insert(
          SkillsCompanion.insert(
            title: s['title'],
            level: Value(s['level']),
            currentProgress: Value(s['currentProgress']),
            userId: userIdMap[s['oldUserId']]!,
            activityTypeId: activityTypeIdMap[s['oldActivityTypeId']]!,
          ),
        );
      }

      for (final g in (data['goals'] as List)) {
        await db.into(db.goals).insert(
          GoalsCompanion.insert(
            weeklyWorkoutTarget: g['weeklyWorkoutTarget'],
            userId: Value(userIdMap[g['oldUserId']]),
          ),
        );
      }
    });
  }
}

final backupControllerProvider = AsyncNotifierProvider<BackupController, DateTime?>(
  BackupController.new,
);