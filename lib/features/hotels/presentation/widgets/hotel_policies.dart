import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelPolicies extends StatelessWidget {
  const HotelPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _buildHeader(),
        ),
        SizedBox(height: 16.h),
        _buildPoliciesContainer(),
      ],
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
          'سياسات الفندق',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Madani Arabic',
            color: const Color(0xFF1D2939),
          ),
        ),
      ],
    );
  }

  Widget _buildPoliciesContainer() {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPolicyItem(
            'تسجيل الوصول/تسجيل المغادرة',
            'تسجيل الوصول من الساعة 3:00 مساءً، وتسجيل المغادرة حتى الساعة 12:00 مساءً',
          ),
          SizedBox(height: 20.h),
          _buildPolicyItem(
            'سياسة الإلغاء',
            'إلغاء مجاني حتى 48 ساعة قبل موعد تسجيل الوصول',
          ),
          SizedBox(height: 20.h),
          _buildPolicyItem(
            'الأطفال والأسرة الإضافية',
            'نرحب بالأطفال من جميع الأعمار. تتوفر أسرّة الأطفال عند الطلب.',
          ),
          SizedBox(height: 20.h),
          _buildPolicyItem('حيوانات أليفة', 'الحيوانات الأليفة غير مسموح بها'),
        ],
      ),
    );
  }

  Widget _buildPolicyItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Container(
            width: 8.w,
            height: 8.h,
            decoration: const BoxDecoration(
              color: Color(0xFFFE406F),
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF4A5565),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
