import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/features/activities/presentation/pages/activities_page.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/pages/login_page.dart';
import 'package:gymboo_app/features/auth/presentation/pages/register_page.dart';
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
      final isPublicRoute = state.matchedLocation == '/login' || state.matchedLocation == '/register' || state.matchedLocation == '/splash';

      if (!isLoggedIn && !isPublicRoute) return '/login';
      if (isLoggedIn && state.matchedLocation == '/login') return '/home';

      return null;
    }),
    routes: [
        GoRoute(path: '/splash', pageBuilder: ((context, state) => NoTransitionPage(child: const SplashPage()))),
        GoRoute(path: '/login', pageBuilder: (context,state) => NoTransitionPage(child: const LoginPage()) ),
        GoRoute(path: '/register', pageBuilder: (context,state) => NoTransitionPage(child: const RegisterPage())),
        GoRoute(path: '/home', pageBuilder: (context,state) => NoTransitionPage(child: const Home())), 
        GoRoute(path: '/activities', pageBuilder: (context,state) => NoTransitionPage(child: const ActivitiesPage()))
    ]
  );
});