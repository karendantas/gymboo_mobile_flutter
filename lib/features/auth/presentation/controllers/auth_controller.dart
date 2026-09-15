import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import '../../data/auth_repository.dart';
import '../../domain/models/user.dart';

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    return ref.read(authRepositoryProvider).restoreSession();
  }

  Future<void> register(RegisterPayload payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).register(payload),
    );
  }

  Future<void> completeProfile({
    required String name,
    required int heightCm,
    required int weightKg,
    required List<Weekday> workoutDays,
    required String petName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final updatedUser = await ref
          .read(authRepositoryProvider)
          .completeProfile(name: name, heightCm: heightCm, weightKg: weightKg);
      await ref
          .read(goalRepositoryProvider)
          .updateGoal(workoutDays: workoutDays);
      await ref.read(petRepositoryProvider).rename(petName);
      return updatedUser;
    });
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .login(email: email, password: password),
    );
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).loginWithGoogle(),
    );
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, User?>(
  AuthController.new,
);
