import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';

class BookingHeader extends StatelessWidget {
  final String price;
  final String subtitle;

  const BookingHeader({super.key, required this.price, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 127.h,
      padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
      decoration: BoxDecoration(
        gradient: AppColors.secondary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '4500 ريال ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
                TextSpan(
                  text: ' /ليلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
        ],
      ),
    );
  }
}
