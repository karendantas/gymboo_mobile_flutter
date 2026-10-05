import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/notification_repository.dart';
import '../../domain/model/app_notification.dart';

class NotificationController extends AsyncNotifier<List<AppNotification>> {
  @override
  Future<List<AppNotification>> build() =>
      ref.read(notificationRepositoryProvider).list();

  Future<void> markAsRead(int id) async {
    final current = state.value;
    if (current == null) return;

    final optimistic = current
        .map((n) => n.id == id ? n.copyWith(read: true) : n)
        .toList();
    state = AsyncData(optimistic);

    try {
      await ref.read(notificationRepositoryProvider).markAsRead(id);
    } catch (_) {
      state = AsyncData(current);
    }
  }
}

final notificationControllerProvider =
    AsyncNotifierProvider<NotificationController, List<AppNotification>>(
      NotificationController.new,
    );
