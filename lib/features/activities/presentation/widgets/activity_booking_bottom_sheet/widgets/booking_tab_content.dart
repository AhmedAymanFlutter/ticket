import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

import 'package:ticket/features/tours/data/models/tour_details_model.dart';

class BookingTabContent extends StatelessWidget {
  final int selectedTab;
  final ProductOption? productOption;

  const BookingTabContent({
    super.key,
    required this.selectedTab,
    this.productOption,
  });

  @override
  Widget build(BuildContext context) {
    List<String> content = [];
    String title = '';

    if (selectedTab == 0) {
      content = productOption?.packageDescription ?? [];
      title = 'وصف الحزمة';
    } else if (selectedTab == 1) {
      content = productOption?.termsAndConditions ?? [];
      title = 'الشروط والأحكام';
    } else if (selectedTab == 2) {
      content = productOption?.howToUse ?? [];
      title = 'كيفية الاستخدام';
    }

    if (content.isEmpty) {
      return SizedBox(
        height: 100.h,
        child: Center(
          child: Text(
            title.isNotEmpty ? title : 'لا يوجد محتوى متاح',
            style: const TextStyle(fontFamily: 'Madani Arabic'),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 12.h),
          ...content.map((text) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildCheckmarkItem(text),
              )),
        ],
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
