import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/primary_button.dart';
import 'package:majadigi/core/widgets/footer_widget.dart';
import 'package:majadigi/injection_container.dart' as di;
import 'package:majadigi/features/auth/presentation/bloc/login_bloc.dart';
import 'package:majadigi/features/auth/presentation/bloc/login_event.dart';
import 'package:majadigi/features/auth/presentation/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _obscurePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message, {required bool success}) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? AppColors.blue300 : Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.s1<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (!mounted) return;

          if (state is LoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              _showSnackBar(context, 'Login berhasil', success: true);
              context.go(Routes.entranceLayanan);
            });
          } else if (state is LoginFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              _showSnackBar(context, state.message, success: false);
            });
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 328,
                            child: Stack(
                              children: [

                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF0090FF),
                                          Color(0xFF005699),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                      ),
                                    ),
                                    child: Image.asset(
                                      'lib/assets/images/wayang_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: 264),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Selamat Datang Kembali Di Majadigi!',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.bold(AppTextStyles.h2)
                                                .copyWith(color: AppColors.white),
                                          ),
                                          SizedBox(height: 24),
                                          Text(
                                            'Platform layanan publik Jawa Timur. Cerdas, Praktis, & Terintegrasi.',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.medium(AppTextStyles.body1)
                                                .copyWith(color: AppColors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 0,
                                  left: 12,
                                  child: SafeArea(
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back, color: Colors.white),
                                      onPressed: () {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Email field
                                  TextField(
                                    controller: _emailController,
                                    style: AppTextStyles.medium(AppTextStyles.body1)
                                        .copyWith(color: AppColors.dark300),
                                    decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: AppTextStyles.medium(AppTextStyles.body1)
                                          .copyWith(color: AppColors.dark300),

                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: AppColors.dark200,
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: AppColors.blue300,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 12),

                                  // Password field
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: _obscurePassword,
                                    style: AppTextStyles.medium(AppTextStyles.body1)
                                        .copyWith(color: AppColors.dark300),
                                    decoration: InputDecoration(
                                      hintText: 'Kata Sandi',
                                      hintStyle: AppTextStyles.medium(AppTextStyles.body1)
                                          .copyWith(color: AppColors.dark300),

                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),

                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                          color: AppColors.dark300,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: AppColors.dark200,
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: AppColors.blue300,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16),

                                  GestureDetector(
                                    onTap: () {
                                      context.push(Routes.resetPassword);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lupa Kata Sandi?',
                                          textAlign: TextAlign.start,
                                          style: AppTextStyles.regular(AppTextStyles.body2)
                                              .copyWith(color: AppColors.dark300),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 16),

                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      final isLoading = state is LoginLoading;
                                      return PrimaryButton(
                                        label: isLoading ? 'Memuat...' : 'Masuk',
                                        variant: ButtonVariant.primary,
                                        onPressed: () {
                                          if (isLoading) return;

                                          final email = _emailController.text.trim();
                                          final password = _passwordController.text.trim();

                                          if (email.isEmpty || password.isEmpty) {
                                            _showSnackBar(context, 'Email dan password harus diisi', success: false);
                                            return;
                                          }

                                          context.read<LoginBloc>().add(
                                                LoginSubmitted(
                                                  email: email,
                                                  password: password,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                  ),

                                  SizedBox(height: 16),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Belum memiliki akun?',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(AppTextStyles.body2)
                                            .copyWith(color: AppColors.dark300),
                                      ),

                                      SizedBox(width: 4),

                                      GestureDetector(
                                        onTap: () {
                                          context.push(Routes.register);
                                        },
                                        child: Text(
                                          'Daftar Sekarang',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.bold(AppTextStyles.body2)
                                              .copyWith(color: AppColors.dark300),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 32),

                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.dark100,
                                  ),

                                  SizedBox(height: 16),

                                  SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                      style: FilledButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        side: BorderSide(
                                          color: AppColors.dark200,
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 16),
                                      ).copyWith(
                                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'lib/assets/images/google_icon.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Masuk dengan Google',
                                            style: AppTextStyles.semiBold(AppTextStyles.body1)
                                                .copyWith(color: AppColors.dark300),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: const FooterWidget(),
        ),
      ),
    );
  }

}
