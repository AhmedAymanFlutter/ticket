import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class InclusionOverviewCard extends StatelessWidget {
  final String title;
  const InclusionOverviewCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      constraints: BoxConstraints(minHeight: 100.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFE5653).withOpacity(0.04),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFFE5653).withOpacity(0.02),
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.isNotEmpty ? title : 'نظرة عامة على الباقة',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'استمتع برحلة مميزة مع باقة $title. تجمع هذه الباقة بين الترفيه والاستكشاف لضمان تجربة سياحية لا تُنسى في أرقى الوجهات.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              height: 1.6,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
