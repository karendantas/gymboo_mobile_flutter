import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum AuthProvider { LOCAL, GOOGLE }

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    String? username,
    required AuthProvider provider,
    int? age,
    int? heightCm,
    int? weightKg,
  }) = _User;

  const User._();

  bool get isProfileComplete => heightCm != null && weightKg != null;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
