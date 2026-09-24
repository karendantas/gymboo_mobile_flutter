import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';

class WorkoutSummary {
  const WorkoutSummary({
    required this.activityType,
    required this.durationMinutes,
    this.caloriesBurned,
    this.distanceMeters,
  });

  final HealthWorkoutActivityType activityType;
  final int durationMinutes;
  final double? caloriesBurned;
  final double? distanceMeters;
}

class HealthService {
  final _health = Health();

  static const _types = [
    HealthDataType.STEPS,
    HealthDataType.WORKOUT,
    HealthDataType.DISTANCE_DELTA,
  ];

  Future<void> configure() async {
    await _health.configure();
  }

  Future<bool> requestPermissions() async {
    await _health.configure();
    final granted = await _health.hasPermissions(_types);
    if (granted == true) return true;

    return await _health.requestAuthorization(_types);
  }

  Future<List<HealthDataPoint>> fetchTodayData() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    return _health.getHealthDataFromTypes(
      types: _types,
      startTime: midnight,
      endTime: now,
    );
  }

  Future<int> getStepsToday() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    final steps = await _health.getTotalStepsInInterval(midnight, now);
    return steps ?? 0;
  }

  Future<List<WorkoutSummary>> getWorkoutsToday() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.WORKOUT],
      startTime: midnight,
      endTime: now,
    );

    return data.where((point) => point.value is WorkoutHealthValue).map((
      point,
    ) {
      final value = point.value as WorkoutHealthValue;
      return WorkoutSummary(
        activityType: value.workoutActivityType,
        durationMinutes: point.dateTo.difference(point.dateFrom).inMinutes,
        caloriesBurned: value.totalEnergyBurned?.toDouble(),
        distanceMeters: value.totalDistance?.toDouble(),
      );
    }).toList();
  }
}

final healthServiceProvider = Provider<HealthService>((ref) => HealthService());
