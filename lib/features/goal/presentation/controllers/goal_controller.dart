import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';

final goalControllerProvider = FutureProvider<Goal>((ref) async {
  final user = ref.watch(authControllerProvider).value;
  if (user == null) throw StateError('Sem usuário logado');
  return ref.watch(goalRepositoryProvider).getMyGoal();
});

final weeklyProgressControllerProvider = FutureProvider<WeeklyProgress>((
  ref,
) async {
  final user = ref.watch(authControllerProvider).value;
  if (user == null) throw StateError('Sem usuário logado');
  return ref.watch(goalRepositoryProvider).getWeeklyProgress();
});
