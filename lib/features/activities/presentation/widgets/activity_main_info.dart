import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class ActivityMainInfo extends StatelessWidget {
  const ActivityMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Location
          Text(
            'جدة، المملكة العربية السعودية',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.h),

          // ── Title
          Text(
            'رحلة بحرية فاخرة على الساحل لشخصين',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
              height: 1.4,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.h),

          // ── Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '4.6 من 70 تقييماً',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.star, color: Colors.amber, size: 18.sp),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Feature Tags
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildFeatureChip('شخصان بالغان'),
              _buildFeatureChip('3 ساعات'),
              _buildFeatureChip('إلغاء مجاني'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F6F0),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xFF10B981),
          fontWeight: FontWeight.w500,
          fontFamily: 'Madani Arabic',
        ),
      ),
    );
  }
}
