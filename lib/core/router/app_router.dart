import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/features/activities/domain/models/activity.dart';
import 'package:gymboo_app/features/activities/presentation/pages/activities_page.dart';
import 'package:gymboo_app/features/activities/presentation/pages/create_activity_page.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/pages/login_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/profile_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step1_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step2_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_step3_page.dart';
import 'package:gymboo_app/features/home/presentation/pages/home_page.dart';

class _GoRouterRefreshNotifier extends ChangeNotifier {
  _GoRouterRefreshNotifier(Ref ref) {
    ref.listen<AsyncValue>(authControllerProvider, (_, _) => notifyListeners());
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = _GoRouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: refreshNotifier,
    redirect: ((context, state) {
      final authState = ref.read(authControllerProvider);
      if (authState.isLoading) return null;

      final user = authState.value;
      final isLoggedIn = user != null;

      final publicRoutes = {
        '/login',
        '/register',
        '/register/goal',
        '/register/pet',
        '/onboarding',
      };
      final isPublicRoute = publicRoutes.contains(state.matchedLocation);

      if (!isLoggedIn && !isPublicRoute) return '/onboarding';

      if (isLoggedIn && !user.isProfileComplete) {
        final isAlreadyCompleting =
            state.matchedLocation == '/register/goal' ||
            state.matchedLocation == '/register/pet';
        if (!isAlreadyCompleting) return '/register/goal';
        return null;
      }

      if (isLoggedIn && isPublicRoute) {
        return '/home';
      }

      return null;
    }),
    routes: [
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: OnboardingPage()),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: RegisterStep1Page()),
      ),
      GoRoute(
        path: '/register/goal',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: RegisterStep2Page()),
      ),
      GoRoute(
        path: '/register/pet',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: RegisterStep3Page()),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
      ),
      GoRoute(
        path: '/activities',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ActivitiesPage()),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ProfilePage()),
      ),
      GoRoute(
        path: '/activities',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ActivitiesPage()),
      ),
      GoRoute(
        path: '/activities/new',
        builder: (context, state) => const CreateActivityPage(),
      ),
      GoRoute(
        path: '/activities/:id/edit',
        builder: (context, state) =>
            CreateActivityPage(existingActivity: state.extra as Activity?),
      ),
    ],
  );
});
