import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});
  Future<User> register({required String name, required String email, required String password, required String petName});
  Future<void> logout();
  Future<User?> restoreSession(); 
}

class LocalAuthRepository implements AuthRepository {

  LocalAuthRepository(this._db);
  
  final AppDatabase _db;

  static const _sessionKey = 'gymboo_current_user_id';

  User _toDomain(UserRow row){
    return User(
       id: row.userId.toString(),
      name: row.name,
      email: row.email,
      height: row.height ?? 0,
      weight: row.weight ?? 0,
    );
  }

  Future<void> _saveSession(int userId) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sessionKey, userId);
  }

  @override
  Future<User> login({required String email, required String password}) async {
    //lembrar de criptografar
    final row = await (_db.select(_db.users)
    ..where((table) => table.email.equals(email) & table.password.equals(password))).getSingleOrNull();

    if (row == null) {
      throw Exception('E-mail ou senha inválidos.');
    }

    await _saveSession(row.userId);
    return _toDomain(row);
  }

  @override
  Future<User> register({required String name, required String email, required String password, required String petName})  async {
    
    
    final newId = await _db.transaction( 
      () async { 
        final userId = await _db.into(_db.users).insert(
          UsersCompanion.insert(
              name: name,
              email: email,
              password: password,
          )
        );

          await _db.into(_db.petVirtuals).insert(
            PetVirtualsCompanion.insert(
              name: petName,
              userId: userId,
            ),
          );

           // Valores padrão iniciais — ajustar quando o onboarding (RF1.1,
          // segunda etapa) coletar isso do usuário de verdade.
          await _db.into(_db.goals).insert(
            GoalsCompanion.insert(
              weeklyWorkoutTarget: 3,
              dailyWaterGoalMl: 2000,
              userId: Value(userId),
            ),
          );
 
      return userId;
    
    });

    await _saveSession(newId);

    final row = await (_db.select(_db.users)
      ..where((table) => table.userId.equals(newId))
    ).getSingle();

    return _toDomain(row);
    
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);
  }

  @override
  Future<User?> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUserId = prefs.getInt(_sessionKey);

    if (savedUserId == null) return null;

    final row = await (_db.select(_db.users)..where((table) => table.userId.equals(savedUserId))).getSingle();

    return _toDomain(row);
  }

}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return LocalAuthRepository(ref.watch(databaseProvider));
});