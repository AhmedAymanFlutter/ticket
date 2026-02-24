import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class InclusionHeader extends StatelessWidget {
  const InclusionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
          'أبرز مميزات الباقة',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            fontFamily: 'Madani Arabic',
          ),
        ),
      ],
    );
  }
}
