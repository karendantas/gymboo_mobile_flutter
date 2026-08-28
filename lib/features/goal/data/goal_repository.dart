import 'package:drift/drift.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GoalRepository {
  Future<Goal> getMyGoal(String userId);
  Future<WeeklyProgress> getWeeklyProgress(String userId);
}

class LocalGoalRepository implements GoalRepository {
  LocalGoalRepository(this._db);
    final AppDatabase _db;
 
  @override
  Future<Goal> getMyGoal(String userId) async {
    final row = await (_db.select(_db.goals)
          ..where((tbl) => tbl.userId.equals(int.parse(userId))))
        .getSingle();
 
    final target = row.weeklyWorkoutTarget;
 
    return Goal(
      id: row.goalId.toString(),
      weeklyWorkoutTarget: target,
      dailyWaterGoalMl: row.dailyWaterGoalMl,
    );
  }

   @override
  Future<WeeklyProgress> getWeeklyProgress(String userId) async {
    final now = DateTime.now();

    final monday = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    final nextMonday = monday.add(const Duration(days: 7));
 
    final rows = await (_db.select(_db.activities)
          ..where((tbl) =>
              tbl.userId.equals(int.parse(userId)) &
              tbl.date.isBiggerOrEqualValue(monday) &
              tbl.date.isSmallerThanValue(nextMonday)))
        .get();
 
    // Dias que tiveram pelo menos uma atividade registrada = "completo".
    final daysWithActivity = rows.map((r) => _weekdayOf(r.date)).toSet();
 
    final completedByDay = <Weekday, bool>{
      for (final day in Weekday.values) day: daysWithActivity.contains(day),
    };
 
    return WeeklyProgress(completedByDay: completedByDay);
  }

    Weekday _weekdayOf(DateTime date) {
    // DateTime.weekday: 1=segunda ... 7=domingo
    const order = [
      Weekday.seg,
      Weekday.ter,
      Weekday.qua,
      Weekday.qui,
      Weekday.sex,
      Weekday.sab,
      Weekday.dom,
    ];
    return order[date.weekday - 1];
  }
}

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  return LocalGoalRepository(ref.watch(databaseProvider));
});