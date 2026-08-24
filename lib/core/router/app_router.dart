import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/features/activities/presentation/pages/activities_page.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/pages/login_page.dart';
import 'package:gymboo_app/shared/home_test.dart';

final appRouterProvider = Provider<GoRouter>((ref) {

  final authState = ref.watch(authControllerProvider);
  
  return GoRouter(
    initialLocation: '/home',
    
    redirect: ((context, state) {
      if (authState.isLoading) return null;
      final isLoggedIn = authState.value != null;
      final isAuthRoute = state.matchedLocation == '/login';

      if (!isLoggedIn && !isAuthRoute) return '/login';
      if (isLoggedIn && isAuthRoute) return '/home';
    }),
    routes: [
        GoRoute(path: '/login', pageBuilder: (context,state) => NoTransitionPage(child: const LoginPage()) ),
      GoRoute(path: '/home', pageBuilder: (context,state) => NoTransitionPage(child: const Home())), //MUDAR DEPOIS
        GoRoute(path: '/activities', pageBuilder: (context,state) => NoTransitionPage(child: const ActivitiesPage()))
    ]
  );
});