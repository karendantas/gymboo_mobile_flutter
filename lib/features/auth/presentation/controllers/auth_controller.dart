import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import '../../data/auth_repository.dart';
import '../../domain/models/user.dart';

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    // roda uma vez, no boot do app — tenta restaurar sessão salva
    return ref.read(authRepositoryProvider).restoreSession();
  }

  Future<void> createLocalProfile({
  required String name,
  required String petName,
  required int weeklyWorkoutTarget,
  int? height,
  int? weight,
  String? googleId,
  String? googleEmail,
}) async {
  state = const AsyncLoading();
  state = await AsyncValue.guard(() async {
    final user = await ref.read(authRepositoryProvider).createLocalProfile(
          name: name,
          height: height,
          weight: weight,
          googleId: googleId, 
          email: googleEmail,
        );

    await ref.read(petRepositoryProvider).createPet(userId: user.id, name: petName);

    await ref.read(goalRepositoryProvider).createGoal(
          userId: user.id,
          weeklyWorkoutTarget: weeklyWorkoutTarget,
        );

    return user;
  });
}
}

final authControllerProvider = AsyncNotifierProvider<AuthController, User?>(AuthController.new);