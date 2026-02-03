import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const CustomCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(33.0.w),
      width: 300
          .w, // Keeping 390 as effectively 100% width or close to the spec 389
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0.r)),
        border: Border.all(width: 0.8, color: AppColors.lightGray),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
            color: Color(0x1A000000),
          ),
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: Column(
        children: [
          icon,
          SizedBox(height: 8.h),
          Text(
            title,
            style: AppTextStyle.setIBMTextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.brandPrimary,
            ),
          ),
          Text(
            subtitle,
            style: AppTextStyle.setIBMTextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.brandPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
