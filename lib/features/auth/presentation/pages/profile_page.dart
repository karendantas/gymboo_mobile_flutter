import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authController = ref.watch(authControllerProvider.notifier);

    return Scaffold(
      body: 
      Center(child: ElevatedButton(onPressed: () {authController.logout();}, child: Text('Deslogar')),),
          bottomNavigationBar: const   BottomTabRetro(),
      );
  }
}
