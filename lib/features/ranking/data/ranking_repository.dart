import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';

import '../domain/models/ranking_entry.dart';

class RankingRepository {
  RankingRepository(this._dio);
  final Dio _dio;

  Future<List<RankingEntry>> top() async {
    final response = await _dio.get('/api/ranking');
    return (response.data as List)
        .map((e) => RankingEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final rankingRepositoryProvider = Provider(
  (ref) => RankingRepository(ref.watch(dioProvider)),
);

final rankingProvider = FutureProvider<List<RankingEntry>>(
  (ref) => ref.watch(rankingRepositoryProvider).top(),
);
