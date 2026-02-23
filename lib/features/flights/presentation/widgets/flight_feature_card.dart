import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SvgPicture.asset('assets/photo/Container.svg'),
          SizedBox(height: 16.h),
          Text(
            title.tr(),
            style: TextStyle(
              color: const Color(0xFF282A51),
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            desc.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF8A8A8A),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
