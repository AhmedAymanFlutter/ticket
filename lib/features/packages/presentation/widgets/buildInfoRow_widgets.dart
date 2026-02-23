import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

Widget buildInfoRow() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildInfoItem(
            'عروسان',
            Icons.group_outlined,
            const Color(0xFFFFF0F0),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: buildInfoItem(
            '5 أيام',
            Icons.wb_sunny_outlined,
            const Color(0xFFFFF7F0),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: buildInfoItem(
            '4 ليال',
            Icons.nightlight_outlined,
            const Color(0xFFF6F0FF),
          ),
        ),
      ],
    ),
  );
}

Widget buildInfoItem(String label, IconData icon, Color iconBg) {
  return Container(
    height: 94.h,
    decoration: BoxDecoration(
      color: const Color(0xFFF9F9F9),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
          child: Icon(icon, size: 24.sp, color: const Color(0xFFFF5252)),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            fontFamily: 'Madani Arabic',
          ),
        ),
      ],
    ),
  );
}
