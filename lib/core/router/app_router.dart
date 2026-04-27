import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/features/auth/presentation/pages/login_page.dart';
import 'package:majadigi/features/auth/presentation/pages/splash_page.dart';

import '../../features/auth/presentation/pages/entrance_page.dart';

class Routes {
  Routes._();
  static const splash = '/';
  static const entrance = '/entrance';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.entrance,
      name: 'entrance',
      builder: (context, state) => const EntrancePage(),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
  ]
);