import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymboo_app/core/network/secure_storage.dart';
import '../domain/models/user.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';

class RegisterPayload {
  const RegisterPayload({
    required this.fullName,
    required this.email,
    required this.password,
    this.username,
    required this.workoutDays,
    required this.weightKg,
    required this.heightCm,
    required this.petType,
    required this.petName,
  });

  final String fullName;
  final String email;
  final String password;
  final String? username;
  final List<Weekday> workoutDays;
  final int weightKg;
  final int heightCm;
  final String petType;
  final String petName;

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'username': username,
        'workoutDays': workoutDays.map((d) => d.name).toList(),
        'weightKg': weightKg,
        'heightCm': heightCm,
        'petType': petType,
        'petName': petName,
      };
}
abstract class AuthRepository {
  Future<User> register(RegisterPayload payload);
  Future<User> completeProfile({required String name, required int heightCm, required int weightKg});
  Future<User> login({required String email, required String password});
  Future<User> loginWithGoogle();
  Future<User?> restoreSession();
  Future<void> logout();
}

class ApiAuthRepository implements AuthRepository {
  ApiAuthRepository(this._dio);
  final Dio _dio;

  static const _googleWebClientId =
      '790878229192-ovkq18404gmvb065gqqq241u04oa5u9i.apps.googleusercontent.com';

  static const _googleAndroidClientId =
      '790878229192-nuujild9s6djog7dm08u4m5keh4f5krs.apps.googleusercontent.com';
  bool _googleInitialized = false;

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    await GoogleSignIn.instance.initialize(
      clientId: _googleAndroidClientId,
      serverClientId: _googleWebClientId,
    );
    _googleInitialized = true;
  }

  Future<User> _handleAuthResponse(Map<String, dynamic> data) async {
    await SecureStorage.saveToken(data['token'] as String);
    return User.fromJson(data['user'] as Map<String, dynamic>);
  }

  @override
  Future<User> register(RegisterPayload payload) async {
    final response = await _dio.post('/api/auth/register', data: payload.toJson());
    return _handleAuthResponse(response.data as Map<String, dynamic>);
  }

  @override
  Future<User> completeProfile({required String name, required int heightCm, required int weightKg}) async {
    final response = await _dio.put('/api/users/me', data: {
      'name': name,
      'heightCm': heightCm,
      'weightKg': weightKg,
    });
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<User> login({required String email, required String password}) async {
    final response = await _dio.post('/api/auth/login', data: {'email': email, 'password': password});
    return _handleAuthResponse(response.data as Map<String, dynamic>);
  }

  @override
  Future<User> loginWithGoogle() async {
    await _ensureGoogleInitialized();
    final googleSignIn = GoogleSignIn.instance;

    GoogleSignInAccount? account;
    try {
      account = await googleSignIn.attemptLightweightAuthentication();
    } catch (_) {
      account = null;
    }

    if (account == null) {
      try {
        account = await googleSignIn.authenticate();
      } on GoogleSignInException catch (e) {
        throw Exception('Login com Google cancelado ou falhou: ${e.description}');
      }
    }

    final auth = await account.authentication;
    final idToken = auth.idToken;
    if (idToken == null) throw Exception('Não foi possível obter o ID Token do Google');

    final response = await _dio.post('/api/auth/google', data: {'idToken': idToken});
    return _handleAuthResponse(response.data as Map<String, dynamic>);
  }

  @override
  Future<User?> restoreSession() async {
    final token = await SecureStorage.getToken();
    if (token == null) return null;

    try {
      final response = await _dio.get('/api/users/me');
      return User.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
        await SecureStorage.clearToken();
        return null;
      }
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await SecureStorage.clearToken();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return ApiAuthRepository(ref.watch(dioProvider));
});