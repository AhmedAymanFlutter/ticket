import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/packages/presentation/widgets/destinations/models/destination_item.dart';
import 'package:ticket/features/packages/presentation/widgets/destinations/widgets/destination_card.dart';

Widget buildDestinationsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ── Section header
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
                Text(
                  'الوجهات المشمولة',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'استكشف أبرز معالم دبي',
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
      // ── Destination cards list
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: sampleDestinations
              .map((dest) => DestinationCard(destination: dest))
              .toList(),
        ),
      ),
    ],
  );
}
