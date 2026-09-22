import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_log.dart';

import '../../data/pet_log_repository.dart';

final petLogControllerProvider = FutureProvider<List<PetLog>>((ref) {
  return ref.watch(petLogRepositoryProvider).list();
});
