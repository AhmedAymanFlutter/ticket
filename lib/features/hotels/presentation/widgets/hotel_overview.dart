import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelOverview extends StatelessWidget {
  const HotelOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            fontFamily: 'Madani Arabic', // Using Madani Arabic as requested
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
            color: const Color(0x1A000000), // #0000001A
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: const Color(0x1A000000), // #0000001A
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Text(
        'استمتع بتجربة فخامة لا مثيل لها في فندق برج العرب جميرا الأيقوني، أفخم فندق في العالم. يقف هذا الفندق شامخاً على جزيرته الخاصة، ويُقدم تحفة معمارية تُطل على مناظر خلابة للخليج العربي وأفق دبي الساحر.\n\n'
        'لقد صُممت كل التفاصيل بعناية فائقة لتوفير تجربة استثنائية للضيوف. فمنذ لحظة وصولكم عبر خدمة النقل الخاصة بنا من المطار، ستنغمسون في خدمة عالمية المستوى، وتناول طعام فاخر في مطاعمنا الحائزة على نجمة ميشلان، وإقامة تُعيد تعريف الفخامة.\n\n'
        'مثالي للمسافرين المميزين، والعرسان، والباحثين عن أرقى مستويات الضيافة. سواء كنتم هنا للعمل أو للترفيه، يضمن فريقنا المتفاني أن تتجاوز كل لحظة من إقامتكم توقعاتكم.',
        textAlign: TextAlign.right,
        style: GoogleFonts.ibmPlexSansArabic(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 27.63 / 16,
          color: const Color(0xFF475467),
        ),
      ),
    );
  }
}
