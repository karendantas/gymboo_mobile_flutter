import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';

import '../../data/pet_repository.dart';
import '../../domain/models/virtual_pet.dart';

final petControllerProvider = AsyncNotifierProvider<PetController, VirtualPet>(
  PetController.new,
);

class PetController extends AsyncNotifier<VirtualPet> {
  @override
  Future<VirtualPet> build() async {
    final user = ref.watch(authControllerProvider).value;

    if (user == null) {
      throw StateError('Sem usuário logado');
    }
    return ref.watch(petRepositoryProvider).getMyPet();
  }

  Future<bool> edit({String? name, String? type}) async {
    try {
      await ref.read(petRepositoryProvider).edit(name, type);
      ref.invalidateSelf();
      ref.invalidate(homeDataProvider);
      return true;
    } catch (e) {
      return false;
    }
  }
}
