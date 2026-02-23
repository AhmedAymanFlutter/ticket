import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/packages/presentation/pages/package_category_view.dart';
import 'package:ticket/features/packages/presentation/widgets/package_card.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            // Title Section
            Center(
              child: Text(
                'packages.title'.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,

                  color: AppColors.textcolor,
                  fontFamily: 'Madani Arabic',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'packages.description'.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                fontFamily: 'Madani Arabic',
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),

            // Packages List
            PackageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=1000&auto=format&fit=crop',
              title: 'packages.intl_title'.tr(),
              subtitle: 'packages.intl_subtitle'.tr(),
              buttonText: 'packages.explore_now'.tr(),
              isDarkButton: true,
              onExplore: () {
                FadeNavigation.pushFade(
                  context,
                  PackageCategoryView(
                    categoryTitle: 'packages.intl_title'.tr(),
                  ),
                );
              },
            ),
            PackageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1000&auto=format&fit=crop',
              title: 'packages.domestic_title'.tr(),
              subtitle: 'packages.domestic_subtitle'.tr(),
              buttonText: 'packages.explore_now'.tr(),
              onExplore: () {
                FadeNavigation.pushFade(
                  context,
                  PackageCategoryView(
                    categoryTitle: 'packages.domestic_title'.tr(),
                  ),
                );
              },
            ),
            PackageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1548574505-5e239809ee19?q=80&w=1000&auto=format&fit=crop',
              title: 'packages.sea_title'.tr(),
              subtitle: 'packages.sea_subtitle'.tr(),
              buttonText: 'packages.explore_now'.tr(),
              onExplore: () {
                FadeNavigation.pushFade(
                  context,
                  PackageCategoryView(categoryTitle: 'packages.sea_title'.tr()),
                );
              },
            ),

            SizedBox(height: 100.h), // Extra space for bottom nav bar
          ],
        ),
      ),
    );
  }
}
