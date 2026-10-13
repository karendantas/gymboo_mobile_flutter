import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_entry.freezed.dart';
part 'ranking_entry.g.dart';

@freezed
abstract class RankingEntry with _$RankingEntry {
  const factory RankingEntry({
    required int position,
    required String displayName,
    required String petName,
    required String petType,
    required int level,
    required int totalXp,
    required bool currentUser,
  }) = _RankingEntry;

  factory RankingEntry.fromJson(Map<String, dynamic> json) =>
      _$RankingEntryFromJson(json);
}
