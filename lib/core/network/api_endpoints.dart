import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class ApiEndpoints {
  static String get baseUrl {
    final envUrl = dotenv.env['API_URL'];
    if (envUrl != null && envUrl.isNotEmpty) return envUrl;
    if (Platform.isAndroid) return 'http://10.0.2.2:8080';
    return 'http://localhost:8080';
  }
}
