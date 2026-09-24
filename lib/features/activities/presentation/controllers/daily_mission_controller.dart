import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/goal/presentation/controllers/goal_controller.dart';

final dailyActivityIsDoneProvider = FutureProvider<bool>((ref) async {
  final progress = await ref.watch(weeklyProgressControllerProvider.future);

  final today = DateTime.now();
  final todayStr =
      '${today.year.toString().padLeft(4, '0')}-'
      '${today.month.toString().padLeft(2, '0')}-'
      '${today.day.toString().padLeft(2, '0')}';

  final todayDetail = progress.days.firstWhere(
    (day) => day.date == todayStr,
    orElse: () => progress.days.first,
  );

  return todayDetail.completed;
});
