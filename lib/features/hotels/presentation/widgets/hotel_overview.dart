import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HotelOverview extends StatelessWidget {
  final String? description;
  const HotelOverview({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 24.h),
          _buildContentBox(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 4.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFE406F),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          'نظرة عامة على الفندق',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Madani Arabic',
            height: 48 / 20,
            color: const Color(0xFF1D2939),
          ),
        ),
      ],
    );
  }

  Widget _buildContentBox() {
    return Container(
      width: 343.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: HtmlWidget(
        description ??
            'استمتع بتجربة فخامة لا مثيل لها في هذا الفندق الأيقوني. صُممت كل التفاصيل بعناية فائقة لتوفير تجربة استثنائية للضيوف.',
        textStyle: GoogleFonts.ibmPlexSansArabic(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 27.63 / 16,
          color: const Color(0xFF475467),
        ),
      ),
    );
  }
}
