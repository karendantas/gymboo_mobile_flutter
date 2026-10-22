import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/notifications/push_notifications_service.dart';
import 'package:gymboo_app/core/session/session_reset.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_widget_service.dart';

import '../../data/auth_repository.dart';
import '../../domain/models/user.dart';

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    return ref.read(authRepositoryProvider).restoreSession();
  }

  Future<void> _runAuthAction(Future<User> Function() action) async {
    state = const AsyncLoading();
    resetUserScopedProviders(ref);
    state = await AsyncValue.guard(action);
    if (state.hasValue && state.value != null) {
      await ref.read(pushNotificationServiceProvider).init();
    }
  }

  Future<void> register(RegisterPayload payload) async {
    _runAuthAction(() => ref.read(authRepositoryProvider).register(payload));
  }

  Future<void> login({required String email, required String password}) async {
    return _runAuthAction(
      () => ref
          .read(authRepositoryProvider)
          .login(email: email, password: password),
    );
  }

  Future<void> loginWithGoogle() async {
    return _runAuthAction(
      () => ref.read(authRepositoryProvider).loginWithGoogle(),
    );
  }

  Future<void> completeProfile({
    required String name,
    required int heightCm,
    required int weightKg,
    required List<Weekday> workoutDays,
    required String petName,
    required String type,
  }) async {
    return _runAuthAction(() async {
      final updatedUser = await ref
          .read(authRepositoryProvider)
          .completeProfile(name: name, heightCm: heightCm, weightKg: weightKg);
      await ref
          .read(goalRepositoryProvider)
          .updateGoal(workoutDays: workoutDays);
      await ref.read(petRepositoryProvider).edit(petName, type);
      return updatedUser;
    });
  }

  Future<void> updateProfile({
    required String name,
    required int heightCm,
    required int weightKg,
  }) async {
    final updated = await ref
        .read(authRepositoryProvider)
        .completeProfile(name: name, heightCm: heightCm, weightKg: weightKg);
    state = AsyncData(updated);
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    await ref.read(petWidgetServiceProvider).clear();
    state = const AsyncData(null);
    resetUserScopedProviders(ref);
  }

  Future<void> deleteAccount() async {
    await ref.read(authRepositoryProvider).deleteAccount();
    await ref.read(petWidgetServiceProvider).clear();
    state = const AsyncData(null);
    resetUserScopedProviders(ref);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, User?>(
  AuthController.new,
);
