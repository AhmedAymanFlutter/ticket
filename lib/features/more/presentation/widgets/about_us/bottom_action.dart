import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsBottomAction extends StatelessWidget {
  const AboutUsBottomAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 48.h),
      child: Container(
        width: 343.w,
        constraints: BoxConstraints(minHeight: 237.h),
        padding: EdgeInsets.all(48.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'about.ready_to_start_title'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Madani Arabic',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'about.ready_to_start_subtitle'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Madani Arabic',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Container(
              width: 247.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_in_talk_outlined,
                    color: const Color(0xFFFE406F),
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),

                  Text(
                    'about.call_now'.tr(),
                    style: TextStyle(
                      color: const Color(0xFFFE406F),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
