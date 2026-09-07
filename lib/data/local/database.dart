import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Users,
  ActivityTypes,
  VirtualPet,
  Activities,
  Skills,
  Goals,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  //Aumentar esse número a cada migration
  @override
  int get schemaVersion => 3;

    @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 3) {
        await m.addColumn(users, users.googleId); 
      }

    },
  );

  Future<void> createFullProfile({
  required String name,
  int? height,
  int? weight,
  required String petName,
  required int weeklyWorkoutTarget,
  required int dailyWaterGoalMl,
}) async {
  await transaction(() async {
    final userId = await into(users).insert(
      UsersCompanion.insert(name: name, height: Value(height), weight: Value(weight)),
    );
    await into(virtualPet).insert(
      VirtualPetCompanion.insert(name: petName, userId: userId),
    );
    await into(goals).insert(
      GoalsCompanion.insert(
        userId: Value(userId),
        weeklyWorkoutTarget: weeklyWorkoutTarget,

      ),
    );
  });
}
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gymboo.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});