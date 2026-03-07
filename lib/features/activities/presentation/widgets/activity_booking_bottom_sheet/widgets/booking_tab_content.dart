import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class BookingTabContent extends StatelessWidget {
  final int selectedTab;

  const BookingTabContent({super.key, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    if (selectedTab == 1) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'سياسات الحجز',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'يجب على الضيوف الوصول قبل 30 دقيقة على الأقل من وقت الحجز المحدد.',
            ),
            SizedBox(height: 24.h),
            Text(
              'سياسة الإلغاء',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem('التذاكر غير قابلة للاسترداد.'),
          ],
        ),
      );
    } else if (selectedTab == 2) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تفاصيل',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'اتبع التعليمات للوصول إلى منطقة الصعود إلى الطائرة.',
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'استخدم تذكرتك الإلكترونية لإتمام عملية تسجيل الوصول.',
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 100.h,
      child: const Center(
        child: Text(
          'وصف الحزمة',
          style: TextStyle(fontFamily: 'Madani Arabic'),
        ),
      ),
    );
  }

  Widget _buildCheckmarkItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check, color: Colors.black, size: 20.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF1F2937),
              fontFamily: 'Madani Arabic',
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
