import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_log.dart';

abstract class PetLogRepository {
  Future<List<PetLog>> list();
}

class ApiPetLogRepository implements PetLogRepository {
  ApiPetLogRepository(this._dio);
  final Dio _dio;

  @override
  Future<List<PetLog>> list() async {
    final response = await _dio.get('/api/pet/logs');
    return (response.data as List)
        .map((e) => PetLog.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final petLogRepositoryProvider = Provider<PetLogRepository>(
  (ref) => ApiPetLogRepository(ref.watch(dioProvider)),
);
