import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';
import 'package:health/health.dart';

ActivityCategory mapHealthExerciseType(HealthWorkoutActivityType type) {
  switch (type) {
    case HealthWorkoutActivityType.RUNNING:
    case HealthWorkoutActivityType.WALKING:
    case HealthWorkoutActivityType.BIKING:
      return ActivityCategory.CARDIO;
    case HealthWorkoutActivityType.WEIGHTLIFTING:
    case HealthWorkoutActivityType.CALISTHENICS:
      return ActivityCategory.MUSCULACAO;
    case HealthWorkoutActivityType.YOGA:
      return ActivityCategory.FLEXIBILIDADE;
    default:
      return ActivityCategory.OUTRO;
  }
}

String workoutTypeLabel(HealthWorkoutActivityType type) {
  switch (type) {
    case HealthWorkoutActivityType.RUNNING:
      return 'Corrida';
    case HealthWorkoutActivityType.WALKING:
      return 'Caminhada';
    case HealthWorkoutActivityType.BIKING:
      return 'Ciclismo';
    case HealthWorkoutActivityType.WEIGHTLIFTING:
      return 'Musculação';
    case HealthWorkoutActivityType.YOGA:
      return 'Yoga';
    default:
      return 'Atividade';
  }
}
