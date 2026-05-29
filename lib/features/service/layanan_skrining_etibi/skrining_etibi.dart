import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/core/widgets/service_card.dart';

import '../../../core/router/app_router.dart';

class SkriningEtibiPage extends StatefulWidget {
  const SkriningEtibiPage({super.key});

  @override
  State<SkriningEtibiPage> createState() => _SkriningEtibiPage();
}

class _SkriningEtibiPage extends State<SkriningEtibiPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> layananList = [
    {
      'title': 'Isi Form Skrining',
      'description':
      'Info jadwal tindakan operasi RSUD Daha Husada',
      'image': 'lib/assets/images/etibi_sample.png',
    },
    {
      'title': 'Lihat Riwayat Skrining',
      'description':
      'Informasi jumlah kamar rawat inap yang tersedia',
      'image': 'lib/assets/images/etibi_sample.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          // HEADER
          LabeledHeader(
            title: 'Skrining E-TIBI',
            description:
            'Program skrining mandiri Tuberkulosis (TBC) oleh Dinas Kesehatan Provinsi Jawa Timur',
            backgroundImage:
            'lib/assets/images/etibi_background.png',
            searchController: searchController,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onBookmarkPressed: () {},
          ),

          // CONTENT
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                itemCount: layananList.length,
                itemBuilder: (context, index) {
                  final layanan = layananList[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ServiceCard(
                      title: layanan['title']!,
                      description: layanan['description']!,
                      image: layanan['image']!,
                      onPressed: () {
                        if (layanan['title'] == 'Isi Form Skrining') {
                          context.push(Routes.formEtibi);
                        } else {
                          context.push(Routes.riwayatEtibi);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}