import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/features/auth/presentation/pages/entrance_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/list_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/login_page.dart';
import 'package:majadigi/features/auth/presentation/pages/option_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/register_page.dart';
import 'package:majadigi/features/auth/presentation/pages/splash_page.dart';
import 'package:majadigi/features/auth/presentation/pages/ekonomi_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/kesehatan_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/pariwisata_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/sosial_layanan_page.dart';

import '../../features/auth/presentation/pages/entrance_page.dart';

class Routes {
  Routes._();
  static const splash = '/';
  static const entrance = '/entrance';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const entranceLayanan = '/entrance_layanan';
  static const optionLayanan = '/option_layanan';
  static const ekonomiLayanan = '/ekonomi_layanan';
  static const pariwisataLayanan = '/pariwisata';
  static const sosialLayanan = '/sosial_layanan';
  static const kesehatanLayanan = '/kesehatan_layanan';
  static const listLayanan = '/list_layanan';
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
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EntrancePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EntrancePage(),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      name: 'register',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RegisterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.entranceLayanan,
      name: 'entrance layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EntranceLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EntranceLayananPage(),
    ),
    GoRoute(
      path: Routes.optionLayanan,
      name: 'option layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: OptionLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const OptionLayananPage(),
    ),
    GoRoute(
      path: Routes.ekonomiLayanan,
      name: 'ekonomi layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EkonomiLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EkonomiLayananPage(),
    ),
    GoRoute(
      path: Routes.kesehatanLayanan,
      name: 'kesehatan layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: KesehatanLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const KesehatanLayananPage(),
    ),
    GoRoute(
      path: Routes.pariwisataLayanan,
      name: 'pariwisata layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: PariwisataLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const PariwisataLayananPage(),
    ),
    GoRoute(
      path: Routes.sosialLayanan,
      name: 'sosial layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SosialLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const SosialLayananPage(),
    ),
    GoRoute(
      path: Routes.listLayanan,
      name: 'list layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ListLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ListLayananPage(),
    ),
  ]
);