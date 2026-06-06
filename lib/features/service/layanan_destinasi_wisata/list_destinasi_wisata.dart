import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:majadigi/core/router/app_router.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';
import 'package:majadigi/core/widgets/labeled_header.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/destinasi_wisata/presentation/bloc/destinasi_bloc.dart';

class ListDestinasiWisataPage extends StatefulWidget {
  const ListDestinasiWisataPage({super.key});

  @override
  State<ListDestinasiWisataPage> createState() => _ListDestinasiWisataPage();
}

class _ListDestinasiWisataPage extends State<ListDestinasiWisataPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => s1<DestinasiBloc>()..add(FetchAllAndPopular()),
      child: Scaffold(
        backgroundColor: AppColors.dark100,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            LabeledHeader(
              title: 'Destinasi Wisata',
              description: 'SIDITA merupakan media promosi dan informasi destinasi yang tersebar di Jawa Timur.',
              backgroundImage: 'lib/assets/images/background_wisata.png',
              searchController: searchController,
              onBackPressed: () => Navigator.pop(context),
              onBookmarkPressed: () {},
              showSearch: true,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: BlocBuilder<DestinasiBloc, DestinasiState>(
                  builder: (context, state) {
                    if (state.isLoading) return const Center(child: CircularProgressIndicator());
                    if (state.error != null) return Center(child: Text(state.error!));
                    
                    final wisataList = state.listPopuler; // Atau gunakan listAll sesuai kebutuhan

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      itemCount: wisataList.length,
                      itemBuilder: (context, index) {
                        final wisata = wisataList[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () => context.push(Routes.detailLayananDestinasiWisata, extra: wisata.id),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: wisata.imageUrl != null 
                                        ? Image.network(wisata.imageUrl!, width: 96, height: 96, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(width: 96, height: 96, color: Colors.grey))
                                        : Image.asset('lib/assets/images/wisata_sample.png', width: 96, height: 96, fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(wisata.name, style: AppTextStyles.semiBold(AppTextStyles.h3).copyWith(color: AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on, size: 18, color: Color(0xFFE67E00)),
                                            const SizedBox(width: 6),
                                            Expanded(child: Text(wisata.location, style: AppTextStyles.regular(AppTextStyles.body2).copyWith(color: AppColors.dark300), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}