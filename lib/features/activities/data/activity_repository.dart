import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import '../domain/models/activity.dart';
import '../domain/models/activity_category.dart';

abstract class ActivityRepository {
  Future<List<Activity>> list({String? date});
  Future<Activity> create({
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
    String? activityDate,
    String? activityTime,
  });
  Future<Activity> update(
    int id, {
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
  });
  Future<void> delete(int id);
}

class ApiActivityRepository implements ActivityRepository {
  ApiActivityRepository(this._dio);
  final Dio _dio;

  @override
  Future<List<Activity>> list({String? date}) async {
    final response = await _dio.get(
      '/api/activities',
      queryParameters: date != null ? {'date': date} : null,
    );
    return (response.data as List)
        .map((e) => Activity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Activity> create({
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
    String? activityDate,
    String? activityTime,
  }) async {
    final response = await _dio.post(
      '/api/activities',
      data: {
        'title': title,
        'description': description,
        'category': category.name,
        'durationMinutes': durationMinutes,
        'activityDate': activityDate,
        'activityTime': activityTime,
      },
    );
    return Activity.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<Activity> update(
    int id, {
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
  }) async {
    final response = await _dio.put(
      '/api/activities/$id',
      data: {
        'title': title,
        'description': description,
        'category': category.name,
        'durationMinutes': durationMinutes,
      },
    );
    return Activity.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> delete(int id) async {
    await _dio.delete('/api/activities/$id');
  }
}

final activityRepositoryProvider = Provider<ActivityRepository>(
  (ref) => ApiActivityRepository(ref.watch(dioProvider)),
);
