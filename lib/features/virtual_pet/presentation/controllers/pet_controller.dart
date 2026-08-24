import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import '../../data/pet_repository.dart';
import '../../domain/models/virtual_pet.dart';

final petControllerProvider = FutureProvider<VirtualPet>((ref) async {
  final user = ref.watch(authControllerProvider).value;
  if (user == null) throw StateError('Sem usuário logado');
  return ref.watch(petRepositoryProvider).getMyPet(user.id);
});