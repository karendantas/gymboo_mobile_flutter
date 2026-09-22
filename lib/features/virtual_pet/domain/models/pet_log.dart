import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_log.freezed.dart';
part 'pet_log.g.dart';

@freezed
abstract class PetLog with _$PetLog {
  const factory PetLog({
    required int id,
    required String action,
    required String attribute,
    int? oldValue,
    int? newValue,
    required String createdAt,
  }) = _PetLog;

  factory PetLog.fromJson(Map<String, dynamic> json) => _$PetLogFromJson(json);
}
