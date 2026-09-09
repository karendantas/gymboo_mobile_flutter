import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';

abstract class GoalRepository {
  Future<Goal> getMyGoal();
  Future<Goal> updateGoal({required List<Weekday> workoutDays});
  Future<WeeklyProgress> getWeeklyProgress();
}

class ApiGoalRepository implements GoalRepository {
  ApiGoalRepository(this._dio);
  final Dio _dio;

  @override
  Future<Goal> getMyGoal() async {
    final response = await _dio.get('/api/goals');
    return Goal.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<Goal> updateGoal({required List<Weekday> workoutDays}) async {
    final response = await _dio.put('/api/goals', data: {
      'workoutDays': workoutDays.map((d) => d.name).toList(),
    });
    return Goal.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<WeeklyProgress> getWeeklyProgress() async {
    final response = await _dio.get('/api/users/me/weekly-progress');
    return WeeklyProgress.fromJson(response.data as Map<String, dynamic>);
  }
}

final goalRepositoryProvider = Provider<GoalRepository>((ref) => ApiGoalRepository(ref.watch(dioProvider)));