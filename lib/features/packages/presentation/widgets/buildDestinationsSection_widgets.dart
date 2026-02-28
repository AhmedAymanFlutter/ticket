import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'package:ticket/features/packages/presentation/widgets/destinations/models/destination_item.dart';
import 'package:ticket/features/packages/presentation/widgets/destinations/widgets/destination_card.dart';

Widget buildDestinationsSection(List<BranchCityModel> cities) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5252),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'packages.included_destinations'.tr(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'packages.explore_highlights'.tr(),
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF9CA3AF),
                fontFamily: 'Madani Arabic',
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: cities
              .map(
                (city) => DestinationCard(
                  destination: DestinationItem(
                    city: city.name ?? city.slug,
                    title: city.name ?? city.slug,
                    subtitle: 'packages.explore_this_city'.tr(),
                    imageUrl:
                        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}
