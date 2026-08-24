import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});
  Future<User> register({required String name, required String email, required String password});
  Future<void> logout();
  Future<User?> restoreSession(); // lê token salvo; null = sem sessão
}

class FakeAuthRepository implements AuthRepository {
  User? _current;

  @override
  Future<User> login({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _current = User(
      id: 'mock-user-1',
      name: 'Karen Dantas',
      email: email,
      username: email.split('@').first,
      height: 165,
      weight: 60,
    );
  }

  @override
  Future<User> register({required String name, required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _current = User(
      id: 'mock-user-1',
      name: name,
      email: email,
      username: email.split('@').first,
      height: 165,
      weight: 60,
    );
  }

  @override
  Future<void> logout() async => _current = null;

  @override
  Future<User?> restoreSession() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return null; // força tela de login ao abrir o app, por enquanto
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => FakeAuthRepository());