import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import '../domain/models/virtual_pet.dart';

abstract class PetRepository {
  Future<VirtualPet> getMyPet();
  Future<VirtualPet> rename(String name);
  Future<VirtualPet> interact(String action);
}

class ApiPetRepository implements PetRepository {
  ApiPetRepository(this._dio);
  final Dio _dio;

  @override
  Future<VirtualPet> getMyPet() async {
    final response = await _dio.get('/api/pet');
    return VirtualPet.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualPet> rename(String name) async {
    final response = await _dio.patch('/api/pet/name', data: {'name': name});
    return VirtualPet.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<VirtualPet> interact(String action) async {
    final response = await _dio.post(
      '/api/pet/interactions',
      data: {'action': action},
    );
    return VirtualPet.fromJson(response.data as Map<String, dynamic>);
  }
}

final petRepositoryProvider = Provider<PetRepository>(
  (ref) => ApiPetRepository(ref.watch(dioProvider)),
);
