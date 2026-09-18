import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/data/reward_repository.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/wardrobe_controller.dart';

class RewardsController extends AsyncNotifier<List<Reward>> {
  @override
  Future<List<Reward>> build() => ref.read(rewardRepositoryProvider).catalog();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(rewardRepositoryProvider).catalog(),
    );
  }

  Future<bool> equip(String code) async {
    try {
      await ref.read(rewardRepositoryProvider).equip(code);
      await refresh();
      ref.invalidate(petControllerProvider);
      ref.invalidate(homeDataProvider);
      ref.invalidate(wardrobeDataProvider);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> unequip(String code) async {
    try {
      await ref.read(rewardRepositoryProvider).unequip(code);
      await refresh();
      ref.invalidate(petControllerProvider);
      ref.invalidate(homeDataProvider);
      ref.invalidate(wardrobeDataProvider);
      return true;
    } catch (_) {
      return false;
    }
  }
}

final rewardsControllerProvider =
    AsyncNotifierProvider<RewardsController, List<Reward>>(
      RewardsController.new,
    );
