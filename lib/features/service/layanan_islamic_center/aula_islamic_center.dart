import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

import '../../../core/widgets/aula_card.dart';

class AulaIslamicCenter extends StatefulWidget {
  const AulaIslamicCenter({super.key});

  @override
  State<AulaIslamicCenter> createState() => _AulaIslamicCenterState();
}

class _AulaIslamicCenterState extends State<AulaIslamicCenter> {
  final List<Map<String, String>> aulaList = [
    {
      'title': 'Hall Utama',
      'capacity': '2000 Orang',
      'price': 'Rp10.000.000',
      'image': 'lib/assets/images/islamic_sample.png',
    },
    {
      'title': 'Aula Serbaguna',
      'capacity': '500 Orang',
      'price': 'Rp5.000.000',
      'image': 'lib/assets/images/islamic_sample.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark100,
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath: 'lib/assets/images/islamic_background.png',
            showTitle: true,
            title: 'Aula',
            onBackPressed: () {
              context.pop();
            },
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: aulaList.length,
                itemBuilder: (context, index) {
                  final aula = aulaList[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AulaCard(
                      image: aula['image']!,
                      title: aula['title']!,
                      capacity: aula['capacity']!,
                      price: aula['price']!,
                      onPressed: () {
                        context.push(
                          Routes.detailIslamicCenter,
                        );
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