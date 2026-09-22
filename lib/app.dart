import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/audio/music_controller.dart';
import 'package:gymboo_app/core/router/app_router.dart';
import 'package:gymboo_app/core/theme/theme_notifier.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';

class GymbooApp extends ConsumerStatefulWidget {
  const GymbooApp({super.key});

  @override
  ConsumerState<GymbooApp> createState() => _GymbooAppState();
}

class _GymbooAppState extends ConsumerState<GymbooApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(musicControllerProvider.notifier).playBackgroundMusic();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.invalidate(homeDataProvider);
      ref.invalidate(petControllerProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = ref.watch(themeNotifierProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Gymboo',
      debugShowCheckedModeBanner: false,
      theme: themeController.themeData,
      routerConfig: router,
    );
  }
}
