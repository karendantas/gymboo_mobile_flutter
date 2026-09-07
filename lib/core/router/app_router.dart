import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/features/activities/presentation/pages/activities_page.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step_1.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step_2.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step_3.dart';
import 'package:gymboo_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:gymboo_app/features/backup/presentation/pages/backup_page.dart';
import 'package:gymboo_app/features/splash/presentation/pages/splash_page.dart';
import 'package:gymboo_app/features/home/presentation/pages/home_page.dart';


class _GoRouterRefreshNotifier extends ChangeNotifier {
  _GoRouterRefreshNotifier(Ref ref) {
    ref.listen<AsyncValue>(authControllerProvider, (_,_) => notifyListeners());
  }
}


final appRouterProvider = Provider<GoRouter>((ref) {

  final refreshNotifier = _GoRouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refreshNotifier,
    redirect: ((context, state) {
      final authState = ref.read(authControllerProvider);
       if (authState.isLoading) return null;

      final isLoggedIn = authState.value != null;
      final isPublicRoute = state.matchedLocation == '/splash' ||
                            state.matchedLocation == '/onboarding' ||
                            state.matchedLocation == '/register' ||
                            state.matchedLocation == '/register/pet' ||
                            state.matchedLocation == '/register/goal';
      if (!isLoggedIn && !isPublicRoute) return '/onboarding';
      if (isLoggedIn &&
          (state.matchedLocation == '/onboarding' ||
              state.matchedLocation == '/create-profile' ||
              state.matchedLocation.startsWith('/register'))) {
        return '/home';
      }

      return null;
    }),
    routes: [
        GoRoute(path: '/splash', pageBuilder: ((context, state) => NoTransitionPage(child: const SplashPage()))),
        GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
        GoRoute(path: '/register', builder: (context, state) => const RegisterStep1Page()),
        GoRoute(path: '/register/pet', builder: (context, state) => const RegisterStep2Page()),
        GoRoute(path: '/register/goal', builder: (context, state) => const RegisterStep3Page()),  
        GoRoute(path: '/home', pageBuilder: (context,state) => NoTransitionPage(child: const Home())), 
        GoRoute(path: '/activities', pageBuilder: (context,state) => NoTransitionPage(child: const ActivitiesPage())),
        GoRoute(path: '/backup', pageBuilder: (context,state) => NoTransitionPage(child: const BackupPage()))
    ]
  );
});