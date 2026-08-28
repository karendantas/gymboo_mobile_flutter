
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'package:gymboo_app/features/activities/domain/models/activity.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_type.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';

abstract class ActivityRepository {
  Future<List> getActivities (String userId);

   Future<Activity> addActivity({
    required String userId,
    required String petId,
    required String title,
    required DateTime date,
    required int durationMinutes,
    required String activityTypeId,
    String? description,
  });
  Future<void> deleteActivity(String activityId);
}

class LocalActivityRepository implements ActivityRepository {

  LocalActivityRepository(this._db, this._petRepository);

  final AppDatabase _db;
  final PetRepository _petRepository;

   // PLACEHOLDER: pontuação fixa por enquanto. O RF6.2 pede que o cálculo
  // varie por tipo de atividade e duração — ajustar aqui quando vocês
  // definirem a fórmula (ex.: cardio dá mais XP de Resistência).
  int _calculatePoints(int durationMinutes) => (durationMinutes / 5).round();


  Future<ActivityType> _loadActivityType (int id) async {
    final row = await (_db.select(_db.activityTypes)
      ..where((table) => table.activityTypeId.equals((id)))
    ).getSingle();

    return ActivityType(id: row.activityTypeId.toString(), title: row.title);
  }

   Future<Activity> _toDomain(ActivityRow row) async {
    final type = await _loadActivityType(row.activityTypeId);
    return Activity(
      id: row.activityId.toString(),
      title: row.title,
      date: row.date,
      durationMinutes: row.time,
      points: row.points,
      description: row.description,
      type: type,
    );
  }

  @override
  Future<List<dynamic>> getActivities(String userId) async {
    final rows = await (_db.select(_db.activities)
      ..where((table) => table.userId.equals(int.parse(userId)))
      ..orderBy(([(table) => OrderingTerm.desc(table.date)]))
    ).get();

    final activities = <Activity>[];
    for (final row in rows){
      activities.add(await _toDomain(row));
    }

    return activities;
  }

  @override
  Future<Activity> addActivity({
    required String userId, 
    required String petId, 
    required String title, 
    required DateTime date, 
    required int durationMinutes, 
    required String activityTypeId, 
    String? description}) async {
      
      final points = _calculatePoints(durationMinutes);

          final newId = await _db.into(_db.activities).insert(
          ActivitiesCompanion.insert(
            title: title,
            date: date,
            time: durationMinutes,
            points: Value(points),
            description: Value(description),
            activityTypeId: int.parse(activityTypeId),
            userId: int.parse(userId),
          ),
          
        );

        //atribuir pontos ao pet

        await _petRepository.applyDailyActivityReward(petId, pointsGain: points);

        final row = await (_db.select(_db.activities)
          ..where((table) => table.activityId.equals(newId))
        ).getSingle();

        return _toDomain(row);
  }

  @override
  Future<void> deleteActivity(String activityId) async{
    await (_db.delete(_db.activities)
      ..where((table) => table.activityId.equals(int.parse(activityId)))).go();
  }

}

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return LocalActivityRepository(
    ref.watch(databaseProvider),
    ref.watch(petRepositoryProvider),
  );
});