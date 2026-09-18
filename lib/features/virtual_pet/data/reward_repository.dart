import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward.dart';

abstract class RewardRepository {
  Future<List<Reward>> catalog();
  Future<Reward> equip(String code);
  Future<void> unequip(String code);
}

class ApiRewardRepository extends RewardRepository {
  ApiRewardRepository(this._dio);
  final Dio _dio;

  @override
  Future<List<Reward>> catalog() async {
    final response = await _dio.get('/api/rewards');
    return (response.data as List)
        .map((e) => Reward.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Reward> equip(String code) async {
    final response = await _dio.post('/api/rewards/$code/equip');
    return Reward.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> unequip(String code) async {
    await _dio.post('/api/rewards/$code/unequip');
  }
}

final rewardRepositoryProvider = Provider<RewardRepository>(
  (ref) => ApiRewardRepository(ref.watch(dioProvider)),
);
