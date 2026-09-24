import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/daily_mission_controller.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/reward_controller.dart';

import '../../data/activity_repository.dart';
import '../../domain/models/activity.dart';
import '../../domain/models/activity_category.dart';

class ActivitiesController extends AsyncNotifier<List<Activity>> {
  @override
  Future<List<Activity>> build() async {
    return ref.read(activityRepositoryProvider).list();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(activityRepositoryProvider).list(),
    );
  }

  Future<bool> create({
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
    String? activityDate,
    String? activityTime,
  }) async {
    try {
      await ref
          .read(activityRepositoryProvider)
          .create(
            title: title,
            description: description,
            category: category,
            durationMinutes: durationMinutes,
            activityDate: activityDate,
            activityTime: activityTime,
          );
      await refresh();
      ref.invalidate(homeDataProvider);
      ref.invalidate(petControllerProvider);
      ref.invalidate(rewardsControllerProvider);
      ref.invalidate(dailyActivityIsDoneProvider);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> editActivity(
    int id, {
    required String title,
    String? description,
    required ActivityCategory category,
    required int durationMinutes,
  }) async {
    try {
      await ref
          .read(activityRepositoryProvider)
          .update(
            id,
            title: title,
            description: description,
            category: category,
            durationMinutes: durationMinutes,
          );
      await refresh();
      ref.invalidate(homeDataProvider);
      ref.invalidate(petControllerProvider);
      ref.invalidate(rewardsControllerProvider);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      await ref.read(activityRepositoryProvider).delete(id);
      await refresh();
      ref.invalidate(homeDataProvider);
      ref.invalidate(activitiesControllerProvider);
      ref.invalidate(rewardsControllerProvider);
      return true;
    } catch (_) {
      return false;
    }
  }
}

final activitiesControllerProvider =
    AsyncNotifierProvider<ActivitiesController, List<Activity>>(
      ActivitiesController.new,
    );
