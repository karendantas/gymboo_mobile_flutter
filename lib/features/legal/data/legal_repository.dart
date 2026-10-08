import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/network/dio_client.dart';

class LegalSection {
  const LegalSection({required this.title, required this.body});
  final String title;
  final String body;

  factory LegalSection.fromJson(Map<String, dynamic> json) => LegalSection(
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

class LegalDocument {
  const LegalDocument({
    required this.title,
    required this.version,
    required this.updatedAt,
    required this.sections,
  });
  final String title;
  final String version;
  final String updatedAt;
  final List<LegalSection> sections;

  factory LegalDocument.fromJson(Map<String, dynamic> json) => LegalDocument(
    title: json['title'] as String,
    version: json['version'] as String,
    updatedAt: json['updatedAt'] as String,
    sections: (json['sections'] as List)
        .map((e) => LegalSection.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

final termsProvider = FutureProvider<LegalDocument>((ref) async {
  final response = await ref.watch(dioProvider).get('/api/legal/terms');
  return LegalDocument.fromJson(response.data as Map<String, dynamic>);
});
