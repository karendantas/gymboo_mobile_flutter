import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PetColorOption { blue, pink, green, yellow }

class RegistrationFormState {
  const RegistrationFormState({
    this.name = '',
    this.height,
    this.weight,
    this.selectedDays = const {},
    this.petName = '',
    this.petColor = PetColorOption.blue,
    this.googleId,
    this.googleEmail,
  });

  final String name;
  final int? height;
  final int? weight;
  final Set<int> selectedDays;
  final String petName;
  final PetColorOption petColor;
  final String? googleId;  
  final String? googleEmail;

  RegistrationFormState copyWith({
    String? name,
    int? height,
    int? weight,
    Set<int>? selectedDays,
    String? petName,
    PetColorOption? petColor,
    String? googleId,
    String? googleEmail,

  }) {
    return RegistrationFormState(
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      selectedDays: selectedDays ?? this.selectedDays,
      petName: petName ?? this.petName,
      petColor: petColor ?? this.petColor,
      googleId: googleId ?? this.googleId,
      googleEmail: googleEmail ?? this.googleEmail,
 
    );
  }
}

class RegistrationFormController extends Notifier<RegistrationFormState> {
  @override
  RegistrationFormState build() => const RegistrationFormState();

  void updateStep1({required String name, int? height, int? weight, required Set<int> selectedDays}) {
    state = state.copyWith(name: name, height: height, weight: weight, selectedDays: selectedDays);
  }

  void updateStep2({required String petName, required PetColorOption petColor}) {
    state = state.copyWith(petName: petName, petColor: petColor);
  }

  void setGoogleAccount({required String id, required String email}) {
  state = state.copyWith(googleId: id, googleEmail: email);
  }

  void reset() => state = const RegistrationFormState();
}

final registrationFormControllerProvider =
    NotifierProvider<RegistrationFormController, RegistrationFormState>(RegistrationFormController.new);