import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/packages/presentation/widgets/category_package_card.dart';
import 'package:ticket/features/packages/presentation/pages/package_details_view.dart';

class PackageCategoryView extends StatelessWidget {
  final String categoryTitle;

  const PackageCategoryView({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: TicketsAppBar(title: categoryTitle, showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'packages.explore_world'.tr(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textcolor,
                      fontFamily: 'Madani Arabic',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'packages.explore_world_desc'.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF8A8A8A),
                      fontFamily: 'Madani Arabic',
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // List Section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  CategoryPackageCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?q=80&w=1000&auto=format&fit=crop',
                    categoryBadge: 'packages.suitable_for_visa'.tr(),
                    countryName: 'packages.saudi_arabia'.tr(),
                    locationText: 'cities.riyadh'.tr(),
                    cities: [
                      'cities.riyadh'.tr(),
                      'cities.jeddah'.tr(),
                      'cities.makkah'.tr(),
                      'cities.madinah'.tr(),
                      'cities.dammam'.tr(),
                    ],
                    buttonText: 'common.view_details'.tr(),
                    onPhoneTap: () {},
                    onWhatsAppTap: () {},
                    onDetailsTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PackageDetailsView(),
                        ),
                      );
                    },
                  ),
                  // Add more cards as needed
                ],
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
