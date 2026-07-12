
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/shared/home_test.dart';

final appRouterProvider = Provider<GoRouter>((ref) {

  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(  
        path: '/home', 
        builder: (context, state) => Home())
  ]);
});