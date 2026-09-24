import 'package:gymboo_app/core/health/health_service.dart';
import 'package:health/health.dart';

Future<List<HealthDataPoint>> getWorkoutsToday(
  HealthService healthService,
) async {
  final allData = await healthService.fetchTodayData();

  return allData
      .where((point) => point.type == HealthDataType.WORKOUT)
      .toList();
}

void processWorkouts(List<HealthDataPoint> workouts) {
  for (final point in workouts) {
    final value = point.value;

    if (value is WorkoutHealthValue) {
      final activityType = value.workoutActivityType;
      final totalDistance = value.totalDistance;

      final start = point.dateFrom;
      final end = point.dateTo;
      final duration = end.difference(start);

      print(
        'Tipo: $activityType, duração: ${duration.inMinutes}min, distância: $totalDistance',
      );
    }
  }
}
