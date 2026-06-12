import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di;

import 'features/auth/presentation/bloc/login_bloc.dart';
import 'features/auth/presentation/bloc/register_bloc.dart';
import 'features/auth/presentation/bloc/layanan_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MajadigiApp());
}

class MajadigiApp extends StatelessWidget {
  const MajadigiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayananBloc>(
          create: (_) => di.s1<LayananBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => di.s1<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => di.s1<RegisterBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Majadigi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}