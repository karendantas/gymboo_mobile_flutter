import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:gymboo_app/features/activities/domain/models/activities_filters.dart';

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
  Future<PageResult<Activity>> search({
    required ActivitiesFilter filter,
    required int page,
    required int size,
  });
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

  @override
  Future<PageResult<Activity>> search({
    required ActivitiesFilter filter,
    required int page,
    required int size,
  }) async {
    String fmt(DateTime d) =>
        '${d.year.toString().padLeft(4, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}';

    final res = await _dio.get(
      '/api/activities/search',
      queryParameters: {
        if (filter.category != null) 'category': filter.category!.name,
        if (filter.from != null) 'from': fmt(filter.from!),
        if (filter.to != null) 'to': fmt(filter.to!),
        'page': page,
        'size': size,
      },
    );

    final data = res.data as Map<String, dynamic>;
    return PageResult(
      items: (data['content'] as List)
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: data['page'] as int,
      last: data['last'] as bool,
    );
  }
}

final activityRepositoryProvider = Provider<ActivityRepository>(
  (ref) => ApiActivityRepository(ref.watch(dioProvider)),
);
