import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';

import '../domain/model/app_notification.dart';

abstract class NotificationRepository {
  Future<List<AppNotification>> list();
  Future<void> markAsRead(int id);
}

class ApiNotificationRepository implements NotificationRepository {
  ApiNotificationRepository(this._dio);
  final Dio _dio;

  @override
  Future<List<AppNotification>> list() async {
    final response = await _dio.get('/api/notifications');
    return (response.data as List)
        .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> markAsRead(int id) async {
    await _dio.put('/api/notifications/$id/read');
  }
}

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return ApiNotificationRepository(ref.watch(dioProvider));
});
