import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightFeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;

  const FlightFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon placeholder
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.star_outline, // Temporary until SVG refined
              color: const Color(0xFFFE406F),
              size: 32.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            title.tr(),
            style: TextStyle(
              color: const Color(0xFF282A51),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            desc.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF8E8E93),
              fontSize: 14.sp,
              fontFamily: 'Madani Arabic',
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
