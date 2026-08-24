import 'package:dio/dio.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GoalRepository {
  Future<Goal> getMyGoal(String userId);
  Future<WeeklyProgress> getWeeklyProgress(String userId);
}

class DioGoalRepository implements GoalRepository {
  DioGoalRepository(this._dio);
  final Dio _dio;

  @override
  Future<Goal> getMyGoal(String userId) async {
    final response = await _dio.get('/goals', queryParameters: {'userId': userId});
    return Goal.fromJson((response.data as List).first as Map<String, dynamic>);
  }

  @override
  Future<WeeklyProgress> getWeeklyProgress(String userId) async {
    final response = await _dio.get('/weeklyProgress', queryParameters: {'userId': userId});
    return WeeklyProgress.fromJson((response.data as List).first as Map<String, dynamic>);
  }
}

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  return DioGoalRepository(ref.watch(dioProvider));
});