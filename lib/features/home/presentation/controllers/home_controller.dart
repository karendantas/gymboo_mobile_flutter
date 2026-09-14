import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';

typedef HomeData = ({VirtualPet pet, Goal goal, WeeklyProgress progress});

final homeDataProvider = FutureProvider<HomeData>((ref) async {
  final results = await (
    ref.watch(petRepositoryProvider).getMyPet(),
    ref.watch(goalRepositoryProvider).getMyGoal(),
    ref.watch(goalRepositoryProvider).getWeeklyProgress(),
  ).wait;

  return (pet: results.$1, goal: results.$2, progress: results.$3);
});
