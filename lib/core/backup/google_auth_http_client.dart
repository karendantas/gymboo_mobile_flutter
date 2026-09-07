import 'package:http/http.dart' as http;

class GoogleAuthHttpClient extends http.BaseClient {
  GoogleAuthHttpClient(this._headers);
  final Map<String, String> _headers;
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _inner.send(request);
  }
}