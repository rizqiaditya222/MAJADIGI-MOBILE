import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: AppColors.dark100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 216,
                    child: Stack(
                      children: [
                        /// BACKGROUND
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF0090FF),
                                  Color(0xFF005699),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: Opacity(
                              opacity: 1,
                              child: Image.asset(
                                'lib/assets/images/wayang_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        /// TITLE
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'My Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// PROFILE IMAGE
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -52,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.blue150,
                            borderRadius:
                            BorderRadius.circular(
                              32,
                            ),
                          ),
                          child: const Icon(
                            Icons.account_circle,
                            size: 82,
                            color: Color(0xFF156BFF),
                          ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 6,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration:
                            const BoxDecoration(
                              color:
                              Color(0xFF156BFF),
                              shape:
                              BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color:
                              Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 72),

            /// USER INFO
            const Column(
              children: [
                Text(
                  'Andrian faikha',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF303030),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'andrian@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 36),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  /// AKUN & KEAMANAN
                  Text(
                    'Akun & Keamanan',
                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.body1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ProfileMenuItem(
                    icon: Icons.person,
                    title: 'Data diri',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon: Icons.key_outlined,
                    title: 'Ubah Kata Sandi',
                    onTap: () {},
                  ),

                  const SizedBox(height: 32),

                  /// INFORMASI LAINNYA
                  Text(
                    'Informasi Lainnya',
                    style:
                    AppTextStyles.semiBold(
                      AppTextStyles.body1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ProfileMenuItem(
                    icon:
                    Icons.location_on_outlined,
                    title:
                    'Tentang Jawa Timur',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon:
                    Icons.language_outlined,
                    title: 'Ganti Bahasa',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon: Icons.info_outline,
                    title: 'Tentang Majadigi',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon: Icons.star,
                    title: 'Beri Rating',
                    trailing: 'Vers 2.1.1',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon:
                    Icons.description_outlined,
                    title:
                    'Syarat & Ketentuan',
                    onTap: () {},
                  ),

                  _divider(),

                  ProfileMenuItem(
                    icon:
                    Icons.shield_outlined,
                    title:
                    'Kebijakan Privasi',
                    onTap: () {},
                  ),

                  const SizedBox(height: 32),

                  /// LOGOUT BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style:
                      OutlinedButton.styleFrom(
                        side:
                        const BorderSide(
                          color:
                          Color(0xFFFF4D6D),
                        ),
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Keluar',
                        style: TextStyle(
                          color:
                          Color(0xFFFF4D6D),
                          fontSize: 13,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}