import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class GuideInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const GuideInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 0.8),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 4,
            spreadRadius: -2,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 6,
            spreadRadius: -1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Centered circular icon with gradient mask
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: const BoxDecoration(
              color: Color(0xFFF9ECEC),
              shape: BoxShape.circle,
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
              ).createShader(bounds),
              child: Icon(icon, size: 26.sp, color: Colors.white),
            ),
          ),
          SizedBox(height: 14.h),
          // ── Title
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          // ── Description
          Text(
            description,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
