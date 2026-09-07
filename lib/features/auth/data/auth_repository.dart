import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart' show SqliteException;

import '../domain/models/user.dart';

abstract class AuthRepository {
  Future<User> createLocalProfile({
    required String name,
    int? height,
    int? weight,
    String? googleId,
    String? email,
  });
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
        email: '',
        height: row.height ?? 0,
        weight: row.weight ?? 0,
      );
    }
    User _toUser(UserRow row) => User(
        id: row.userId.toString(),
        name: row.name,
        email: '',
        height: row.height ?? 0,
        weight: row.weight ?? 0,
    );

    Future<void> _saveSession(int userId) async{
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_sessionKey, userId);
    }

    @override
    Future<User> createLocalProfile({
    required String name,
    String? email,
    String? googleId,
    int? height,
    int? weight,
  }) async {
    final newId = await _db.into(_db.users).insert(
      UsersCompanion.insert(
        name: name,
        email: Value(email),
        googleId: Value(googleId),
        height: Value(height),
        weight: Value(weight),
      ),
    );
    await _saveSession(newId);
    final row = await (_db.select(_db.users)..where((t) => t.userId.equals(newId))).getSingle();
    return _toUser(row);
  }

  @override
  Future<User?> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUserId = prefs.getInt(_sessionKey);

    if (savedUserId == null) return null;

    final row = await (_db.select(_db.users)..where((table) => table.userId.equals(savedUserId))).getSingleOrNull();

    if (row == null) return null;

    return _toDomain(row);
  }

}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return LocalAuthRepository(ref.watch(databaseProvider));
});