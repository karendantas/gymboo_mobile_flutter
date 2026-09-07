
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/audio/music_controller.dart';
import 'package:gymboo_app/core/router/app_router.dart';
import 'package:gymboo_app/core/theme/theme_notifier.dart';
import 'package:gymboo_app/core/backup/backup_controller.dart';

class GymbooApp extends ConsumerStatefulWidget {
  const GymbooApp({super.key});

  @override
  ConsumerState<GymbooApp> createState() => _GymbooAppState();
}

class _GymbooAppState extends ConsumerState<GymbooApp> {
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      ref.read(musicControllerProvider.notifier).playBackgroundMusic();
      await ref.read(backupControllerProvider.notifier).restoreIfNeeded();
    });
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