import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';

enum PetColorOption { blue, pink, green, yellow }

class RegistrationFormState {
  const RegistrationFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.weightKg,
    this.heightCm,
    this.workoutDays = const {},
    this.petName = '',
    this.petColor = PetColorOption.blue,
  });

  final String name;
  final String email;
  final String password;
  final int? weightKg;
  final int? heightCm;
  final Set<Weekday> workoutDays;
  final String petName;
  final PetColorOption petColor;

  RegistrationFormState copyWith({
    String? name,
    String? email,
    String? password,
    int? weightKg,
    int? heightCm,
    Set<Weekday>? workoutDays,
    String? petName,
    PetColorOption? petColor,
  }) {
    return RegistrationFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      workoutDays: workoutDays ?? this.workoutDays,
      petName: petName ?? this.petName,
      petColor: petColor ?? this.petColor,
    );
  }
}

class RegistrationFormController extends Notifier<RegistrationFormState> {
  @override
  RegistrationFormState build() => const RegistrationFormState();

  void updateStep1({required String name, required String email, required String password}) {
    state = state.copyWith(name: name, email: email, password: password);
  }

  void updateStep2({required int weightKg, required int heightCm, required Set<Weekday> workoutDays}) {
    state = state.copyWith(weightKg: weightKg, heightCm: heightCm, workoutDays: workoutDays);
  }

  void updateStep3({required String petName, required PetColorOption petColor}) {
    state = state.copyWith(petName: petName, petColor: petColor);
  }

  void reset() => state = const RegistrationFormState();
}

final registrationFormControllerProvider =
    NotifierProvider<RegistrationFormController, RegistrationFormState>(RegistrationFormController.new);