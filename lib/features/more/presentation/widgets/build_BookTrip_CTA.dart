import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildBookTripCTA(String whatsappUrl) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsets.all(20.w),
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
        Text(
          'contact.book_trip'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'contact.contact_whatsapp_details'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF666666),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton.icon(
            onPressed: () => launchUrl(Uri.parse(whatsappUrl)),
            icon: SvgPicture.asset(
              'assets/icons/watsapp.svg',
              width: 24.w,
              height: 24.h,
            ),
            label: Text(
              'more.contact_whatsapp'.tr(),
              style: TextStyle(
                fontFamily: 'Madani Arabic',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
