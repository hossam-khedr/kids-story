import 'package:app_mobile/config/routes/app_routes.dart';
import 'package:app_mobile/features/my_library/ui/widgets/progress.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/responses/library_response.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../auth/ui/wdgets/auth_button.dart';

class LibraryItem extends StatelessWidget {
  final LibraryResponse response;
  final void Function()? onTap;

  const LibraryItem({super.key, required this.response, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: ResponsiveHelper.r.paddingAll(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: ResponsiveHelper.r.height(1.5),
          children: [
            Row(
              //mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CustomNetworkImage(
                    src: response.image,
                    width: ResponsiveHelper.r.width(20),
                    height: ResponsiveHelper.r.height(10),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 10,
                        children: [
                          AppText(
                            data: response.title,
                            style: TextStyle(
                              color: AppColors.foreground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.favorite_border),
                        ],
                      ),
                      AppText(
                        data: response.description ?? 'No Data',
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppText(
                        data:
                            '${(response.progress * 100).toStringAsFixed(0)}% مكتمل ',
                      ),
                      ProgressBar(
                        value: response.progress,
                        height: ResponsiveHelper.r.height(1.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AuthButton(
              text: AppStrings.continueReading.tr(),
              borderRadius: 30,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
