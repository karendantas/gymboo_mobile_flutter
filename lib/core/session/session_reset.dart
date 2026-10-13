import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_controller.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_filter_controller.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_list_controller.dart';
import 'package:gymboo_app/features/goal/presentation/controllers/goal_controller.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/notifications/presentation/controller/notification_controller.dart';
import 'package:gymboo_app/features/ranking/data/ranking_repository.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_log_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/wardrobe_controller.dart';

void resetUserScopedProviders(Ref ref) {
  ref.invalidate(homeDataProvider);
  ref.invalidate(petControllerProvider);
  ref.invalidate(wardrobeControllerProvider);
  ref.invalidate(weeklyProgressControllerProvider);
  ref.invalidate(activitiesControllerProvider);
  ref.invalidate(activitiesListControllerProvider);
  ref.invalidate(activitiesFilterProvider);
  ref.invalidate(petLogControllerProvider);
  ref.invalidate(goalControllerProvider);
  ref.invalidate(rankingProvider);
  ref.invalidate(notificationControllerProvider);
  ref.invalidate(petLogControllerProvider);
}
