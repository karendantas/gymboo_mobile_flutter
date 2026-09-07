import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'google_auth_http_client.dart';

class GoogleAccountInfo {
  const GoogleAccountInfo({required this.id, required this.email, this.displayName});
  final String id;
  final String email;
  final String? displayName;
}

class GoogleDriveBackupService {
  static const _backupFileName = 'gymboo_backup.json';
  static const _scopes = [drive.DriveApi.driveAppdataScope];

  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    await GoogleSignIn.instance.initialize(
      serverClientId: '790878229192-ovkq18404gmvb065gqqq241u04oa5u9i.apps.googleusercontent.com',
    );
    _initialized = true;
  }

  /// Só autentica (identidade) — não pede permissão de Drive ainda.
  /// Usado pelo onboarding pra "logar com Google" sem forçar backup junto.
  Future<GoogleAccountInfo?> signIn({bool forceAccountPicker = false}) async {
    await _ensureInitialized();
    final googleSignIn = GoogleSignIn.instance;

    if (forceAccountPicker) {
      await googleSignIn.signOut();
    }

    GoogleSignInAccount? account;
    if (!forceAccountPicker) {
      try {
        account = await googleSignIn.attemptLightweightAuthentication();
      } catch (_) {
        account = null;
      }
    }

    if (account == null) {
      try {
        account = await googleSignIn.authenticate();
      } on GoogleSignInException catch (e) {
        debugPrint('Erro Google Sign-In: ${e.code} - ${e.description}');
        return null;
      } catch (e) {
        debugPrint('Erro inesperado no Google Sign-In: $e');
        return null;
      }
    }

    return GoogleAccountInfo(id: account.id, email: account.email, displayName: account.displayName);
  }

  Future<drive.DriveApi?> _getDriveApi() async {
    await _ensureInitialized();
    final account = await GoogleSignIn.instance.attemptLightweightAuthentication()
        ?? await GoogleSignIn.instance.authenticate();

    final authClient = account.authorizationClient;
    var authorization = await authClient.authorizationForScopes(_scopes);
    authorization ??= await authClient.authorizeScopes(_scopes);
    if (authorization.accessToken.isEmpty) return null;

    return drive.DriveApi(GoogleAuthHttpClient({'Authorization': 'Bearer ${authorization.accessToken}'}));
  }

  Future<bool> uploadBackup(Map<String, dynamic> backupData) async {
    final api = await _getDriveApi();
    if (api == null) return false;

    final jsonBytes = utf8.encode(jsonEncode(backupData));
    final media = drive.Media(Stream.value(jsonBytes), jsonBytes.length);
    final existingFileId = await _findBackupFileId(api);

    try {
      if (existingFileId != null) {
        await api.files.update(drive.File(), existingFileId, uploadMedia: media);
      } else {
        await api.files.create(
          drive.File(name: _backupFileName, parents: ['appDataFolder']),
          uploadMedia: media,
        );
      }
      return true;
    } catch (e) {
      debugPrint('ERRO no upload: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> downloadBackup() async {
    final api = await _getDriveApi();
    if (api == null) return null;

    final fileId = await _findBackupFileId(api);
    if (fileId == null) return null;

    final media = await api.files.get(fileId, downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;
    final bytes = await media.stream.fold<List<int>>([], (previous, chunk) => previous..addAll(chunk));
    return jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
  }

  Future<String?> _findBackupFileId(drive.DriveApi api) async {
    final result = await api.files.list(spaces: 'appDataFolder', q: "name = '$_backupFileName'", $fields: 'files(id, name)');
    if (result.files == null || result.files!.isEmpty) return null;
    return result.files!.first.id;
  }

  Future<void> signOut() async {
    await _ensureInitialized();
    await GoogleSignIn.instance.signOut();
  }
}