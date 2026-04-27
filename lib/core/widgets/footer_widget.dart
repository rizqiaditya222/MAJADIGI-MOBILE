import 'package:flutter/material.dart';
import 'package:majadigi/core/theme/app_colors.dart';
import 'package:majadigi/core/theme/app_text_styles.dart';

class FooterWidget extends StatelessWidget {
  final String poweredByLabel;
  final String poweredBySubtitle;
  final String logoAssetPath;
  final double logoWidth;
  final double logoHeight;

  const FooterWidget({
    Key? key,
    this.poweredByLabel = 'POWERED BY',
    this.poweredBySubtitle = 'Pemerintahan Provinsi Jawa Timur',
    this.logoAssetPath = 'lib/assets/images/majadigi_logo_full.png',
    this.logoWidth = 80,
    this.logoHeight = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        width: double.infinity,
        height: 96,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blue150,
                ),
                child: Image.asset(
                  'lib/assets/images/wayang_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 264),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              poweredByLabel,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.bold(AppTextStyles.body3)
                                  .copyWith(color: AppColors.blue300),
                            ),
                            SizedBox(height: 2),
                            Text(
                              poweredBySubtitle,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.medium(AppTextStyles.body3)
                                  .copyWith(color: AppColors.blue300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      logoAssetPath,
                      width: logoWidth,
                      height: logoHeight,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

