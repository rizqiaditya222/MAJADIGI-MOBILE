import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class LaporanHoaksLacak extends StatefulWidget {
  const LaporanHoaksLacak({super.key});

  @override
  State<LaporanHoaksLacak> createState() =>
      _LaporanHoaksLacakState();
}

class _LaporanHoaksLacakState
    extends State<LaporanHoaksLacak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/hoaks_background.png',
            showTitle: true,
            title: 'Lacak Tiket Laporan',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      'lib/assets/images/hoaks_background.png',
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.04,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Pelacakan Tiket\nPermohonan Anda',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF333333),
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'masukkan no tiket yang telah dikirim ke\nWhatsApp dan Email anda.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9A9A9A),
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Align(
                          alignment:
                          Alignment.centerLeft,
                          child: Text(
                            'No Tiket',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          decoration: InputDecoration(
                            hintText: '8889991202',
                            contentPadding:
                            const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                              borderSide:
                              const BorderSide(
                                color: Color(
                                  0xFF1D73FF,
                                ),
                              ),
                            ),
                            focusedBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                              borderSide:
                              const BorderSide(
                                color: Color(
                                  0xFF1D73FF,
                                ),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                0xFF1D73FF,
                              ),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  14,
                                ),
                              ),
                            ),
                            onPressed: () {
                              // TODO: navigate detail tiket
                            },
                            child: const Text(
                              'Lacak',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}