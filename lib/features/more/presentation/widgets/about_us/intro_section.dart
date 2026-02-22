import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsIntroSection extends StatelessWidget {
  const AboutUsIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'about.title'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'about.company_subtitle'.tr(),
            style: TextStyle(
              color: const Color(0xFFFD6B38),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'about.bold_intro'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    fontFamily: 'Madani Arabic',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'about.description'.tr(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              height: 1.8,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
