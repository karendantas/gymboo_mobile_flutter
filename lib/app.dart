
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/router/app_router.dart';
import 'package:gymboo_app/core/theme/theme_provider.dart';

class GymbooApp extends ConsumerWidget {
  const GymbooApp({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeController = ref.watch(themeControllerProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Gymboo',
      debugShowCheckedModeBanner: false,
      theme: themeController.themeData,
      routerConfig: router,
      
    );
  }
}