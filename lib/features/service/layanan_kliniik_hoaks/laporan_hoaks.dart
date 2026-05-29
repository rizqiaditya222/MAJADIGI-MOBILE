import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';
import 'package:majadigi/core/widgets/primary_button.dart';

class LaporanHoaks extends StatefulWidget {
  const LaporanHoaks({super.key});

  @override
  State<LaporanHoaks> createState() => _LaporanHoaksState();
}

class _LaporanHoaksState extends State<LaporanHoaks> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final laporanController = TextEditingController();
  final linkController = TextEditingController();
  final captchaController = TextEditingController();

  String selectedFile = 'No File Chosen';

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
            title: 'Laporan Hoaks',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color:
                        const Color(0xFFE0F5E8),
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: const Text(
                        'Kirimkan detail informasi yang kamu dapat, akan kami bantu cari klarifikasinya dalam 1x24 jam.',
                        textAlign:
                        TextAlign.center,
                        style: TextStyle(
                          color:
                          Color(0xFF5C8F69),
                          fontSize: 13,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Center(
                      child: Text(
                        'Permohonan Klarifikasi',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    _buildLabel('Nama'),
                    _buildField(
                      controller:
                      namaController,
                      hint: 'Andi',
                    ),

                    const SizedBox(height: 16),

                    _buildLabel(
                        'Alamat Email'),
                    _buildField(
                      controller:
                      emailController,
                      hint:
                      'name@email.com',
                    ),

                    const SizedBox(height: 16),

                    _buildLabel(
                        'Nomor Telepon'),
                    _buildField(
                      controller:
                      phoneController,
                      hint: '08xxxxxx',
                    ),

                    const SizedBox(height: 16),

                    _buildLabel(
                        'Isi Laporan'),
                    TextField(
                      controller:
                      laporanController,
                      maxLines: 8,
                      decoration:
                      InputDecoration(
                        hintText: '...',
                        filled: true,
                        fillColor:
                        Colors.white,
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                        ),
                        enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                          borderSide:
                          BorderSide(
                            color: Colors
                                .grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildLabel(
                        'Link Bukti/Alamat Website'),
                    _buildField(
                      controller:
                      linkController,
                      hint:
                      'https://xxxxxxxx',
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          height: 42,
                          child:
                          ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                0xFF156BFF,
                              ),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed:
                                () {},
                            child:
                            const Text(
                              'Import',
                              style:
                              TextStyle(
                                color: Colors
                                    .white,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            height: 42,
                            alignment:
                            Alignment
                                .centerLeft,
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal:
                              12,
                            ),
                            decoration:
                            BoxDecoration(
                              border:
                              Border.all(
                                color: Colors
                                    .grey
                                    .shade300,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              selectedFile,
                              style:
                              const TextStyle(
                                color: Colors
                                    .grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                      child: Image.asset(
                        'lib/assets/images/hoaks_background.png',
                        height: 90,
                        width:
                        double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller:
                      captchaController,
                      decoration:
                      InputDecoration(
                        hintText:
                        'Kode Captcha ...',
                        filled: true,
                        fillColor:
                        Colors.white,
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                        ),
                        enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                          borderSide:
                          BorderSide(
                            color: Colors
                                .grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    PrimaryButton(
                      label: 'Kirim',
                      onPressed: () {
                        context.push(
                          Routes.laporanHoaksTicket,
                        );
                      },
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

  Widget _buildLabel(String title) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12),
        ),
        enabledBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}