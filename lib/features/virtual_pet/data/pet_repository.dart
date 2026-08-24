import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import '../domain/models/virtual_pet.dart';

abstract class PetRepository {
  Future<VirtualPet> getMyPet(String userId);
}

class DioPetRepository implements PetRepository {
  DioPetRepository(this._dio);
  final Dio _dio;

  @override
  Future<VirtualPet> getMyPet(String userId) async {
    final response = await _dio.get('/virtualPets', queryParameters: {'userId': userId});
    final list = response.data as List;
    return VirtualPet.fromJson(list.first as Map<String, dynamic>);
  }
}

final petRepositoryProvider = Provider<PetRepository>((ref) {
  return DioPetRepository(ref.watch(dioProvider));
});