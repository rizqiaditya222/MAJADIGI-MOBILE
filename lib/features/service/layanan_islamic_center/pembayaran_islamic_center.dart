import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class PembayaranIslamicCenter extends StatefulWidget {
  const PembayaranIslamicCenter({super.key});

  @override
  State<PembayaranIslamicCenter> createState() =>
      _PembayaranIslamicCenterState();
}

class _PembayaranIslamicCenterState
    extends State<PembayaranIslamicCenter> {
  bool isQrisExpanded = false;
  bool isBankExpanded = false;

  String? selectedBank;

  final List<Map<String, String>> banks = [
    {
      'name': 'BCA',
      'account': '740 200 1800',
      'holder': 'A.N Majadigi Komdigi Indonesia',
    },
    {
      'name': 'BNI',
      'account': '740 200 1801',
      'holder': 'A.N Majadigi Komdigi Indonesia',
    },
    {
      'name': 'BRI',
      'account': '740 200 1802',
      'holder': 'A.N Majadigi Komdigi Indonesia',
    },
    {
      'name': 'Mandiri',
      'account': '740 200 1803',
      'holder': 'A.N Majadigi Komdigi Indonesia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/islamic_background.png',
            showTitle: true,
            title: 'Pembayaran',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// CARD AULA
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(16),
                          child: Image.asset(
                            'lib/assets/images/islamic_sample.png',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Asrama',
                                style: AppTextStyles.bold(
                                  AppTextStyles.h2,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.people,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '2000 orang',
                                    style:
                                    AppTextStyles.regular(
                                      AppTextStyles.body2,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.payments,
                                    size: 16,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Mulai dari 10.000.000',
                                    style:
                                    AppTextStyles.regular(
                                      AppTextStyles.body2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pilih Metode Pembayaran',
                      style: AppTextStyles.medium(
                        AppTextStyles.body2,
                      ).copyWith(
                        color: AppColors.dark300,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// QRIS
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.dark200,
                      ),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius:
                          BorderRadius.circular(20),
                          onTap: () {
                            setState(() {
                              isQrisExpanded =
                              !isQrisExpanded;

                              if (isQrisExpanded) {
                                isBankExpanded = false;
                              }
                            });
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.qr_code,
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Text(
                                    'Qris',
                                    style:
                                    AppTextStyles.medium(
                                      AppTextStyles.body1,
                                    ),
                                  ),
                                ),

                                Icon(
                                  isQrisExpanded
                                      ? Icons
                                      .keyboard_arrow_up
                                      : Icons
                                      .keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isQrisExpanded)
                          Padding(
                            padding:
                            const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                  AppColors.dark200,
                                ),
                                borderRadius:
                                BorderRadius.circular(
                                  16,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                    double.infinity,
                                    padding:
                                    const EdgeInsets
                                        .all(24),
                                    decoration:
                                    BoxDecoration(
                                      color: AppColors
                                          .blue300,
                                      borderRadius:
                                      const BorderRadius
                                          .only(
                                        topLeft:
                                        Radius.circular(
                                            16),
                                        topRight:
                                        Radius.circular(
                                            16),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.qr_code_2,
                                        size: 180,
                                        color:
                                        Colors.white,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding:
                                    const EdgeInsets
                                        .all(16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Total',
                                              style:
                                              AppTextStyles
                                                  .medium(
                                                AppTextStyles
                                                    .body1,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'Rp2.500.000',
                                              style:
                                              AppTextStyles
                                                  .bold(
                                                AppTextStyles
                                                    .body1,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(
                                            height: 16),

                                        SizedBox(
                                          width: double
                                              .infinity,
                                          child:
                                          ElevatedButton
                                              .icon(
                                            onPressed:
                                                () {},
                                            icon:
                                            const Icon(
                                              Icons
                                                  .download,
                                            ),
                                            label:
                                            const Text(
                                              'Unduh Kode QR',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// TRANSFER BANK
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.dark200,
                      ),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius:
                          BorderRadius.circular(20),
                          onTap: () {
                            setState(() {
                              isBankExpanded =
                              !isBankExpanded;

                              if (isBankExpanded) {
                                isQrisExpanded = false;
                              }
                            });
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance,
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Text(
                                    'Transfer Bank',
                                    style:
                                    AppTextStyles.medium(
                                      AppTextStyles.body1,
                                    ),
                                  ),
                                ),

                                Icon(
                                  isBankExpanded
                                      ? Icons
                                      .keyboard_arrow_up
                                      : Icons
                                      .keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isBankExpanded)
                          Padding(
                            padding:
                            const EdgeInsets.all(12),
                            child: Column(
                              children:
                              banks.map((bank) {
                                final isSelected =
                                    selectedBank ==
                                        bank['name'];

                                return Container(
                                  margin:
                                  const EdgeInsets
                                      .only(
                                    bottom: 10,
                                  ),
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      14,
                                    ),
                                    border: Border.all(
                                      color: AppColors
                                          .dark200,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading:
                                        const Icon(
                                          Icons
                                              .account_balance,
                                          color:
                                          Colors.blue,
                                        ),
                                        title: Text(
                                          bank[
                                          'name']!,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedBank =
                                            selectedBank ==
                                                bank[
                                                'name']
                                                ? null
                                                : bank[
                                            'name'];
                                          });
                                        },
                                      ),

                                      if (isSelected)
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .all(
                                            12,
                                          ),
                                          child:
                                          Container(
                                            width: double
                                                .infinity,
                                            padding:
                                            const EdgeInsets
                                                .all(
                                              16,
                                            ),
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              const Color(
                                                0xFFEAF2FF,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                14,
                                              ),
                                            ),
                                            child:
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                      Center(
                                                        child:
                                                        Text(
                                                          bank['account']!,
                                                          style:
                                                          const TextStyle(
                                                            fontSize:
                                                            22,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed:
                                                          () {
                                                        Clipboard.setData(
                                                          ClipboardData(
                                                            text: bank['account']!,
                                                          ),
                                                        );

                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                              'Nomor rekening disalin',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon:
                                                      const Icon(
                                                        Icons
                                                            .copy,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(
                                                    height:
                                                    8),

                                                Text(
                                                  bank[
                                                  'holder']!,
                                                  style:
                                                  AppTextStyles.regular(
                                                    AppTextStyles.body2,
                                                  ),
                                                ),

                                                const SizedBox(
                                                    height:
                                                    20),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'Total',
                                                      style:
                                                      AppTextStyles.medium(
                                                        AppTextStyles.body1,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      'Rp2.500.000',
                                                      style:
                                                      AppTextStyles.bold(
                                                        AppTextStyles.body1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  PrimaryButton(
                    label: 'Konfirmasi Pembayaran',
                    onPressed: () {
                      context.push(Routes.islamicCenterFinish);

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}