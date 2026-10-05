import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'toast_service.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final toastServiceProvider = Provider<ToastService>((ref) {
  return ToastService(ref.watch(navigatorKeyProvider));
});
