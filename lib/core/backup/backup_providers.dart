import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'google_drive_backup_service.dart';

final backupServiceProvider = Provider<GoogleDriveBackupService>((ref) {
  return GoogleDriveBackupService();
});