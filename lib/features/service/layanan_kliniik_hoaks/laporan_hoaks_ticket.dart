import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class LaporanHoaksTicket extends StatefulWidget {
  const LaporanHoaksTicket({super.key});

  @override
  State<LaporanHoaksTicket> createState() => _LaporanHoaksTicketState();
}

class _LaporanHoaksTicketState extends State<LaporanHoaksTicket> {
  final String ticketNumber = '8889991202';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/hoaks_background.png',
            showTitle: true,
            title: 'Laporan Hoaks',
            onBackPressed: () {
              context.pop();
            },
          ),

          /// CONTENT CENTER VERTIKAL
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/assets/images/laporan_hoaks.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// CARD TIKET
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Tiket Laporan anda',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF303030),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Berikut adalah tiket laporan hoaks anda',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// TICKET NUMBER
                          Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF1D73FF),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    ticketNumber,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1D73FF),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  top: 0,
                                  bottom: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.content_copy_rounded,
                                      color: Color(0xFF1D73FF),
                                    ),
                                    onPressed: () async {
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: ticketNumber,
                                        ),
                                      );

                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Nomor tiket berhasil disalin',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}