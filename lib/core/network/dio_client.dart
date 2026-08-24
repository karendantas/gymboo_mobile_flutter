import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/api_endpoints.dart';

final dioProvider = Provider<Dio> ((ref) {
  return Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
},);