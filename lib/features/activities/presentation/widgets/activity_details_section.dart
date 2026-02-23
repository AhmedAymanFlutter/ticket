import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_package_card.dart';

class ActivityDetailsSection extends StatelessWidget {
  const ActivityDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ── Section 1: Overview
          _buildSectionHeader('لمحة عامة'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text(
              'استمتع برحلة بحرية فاخرة على طول شواطئ جدة الساحرة على البحر الأحمر. صممت هذه التجربة خصيصاً للأزواج الراغبين في الاسترخاء والاستكشاف والاستمتاع بجمال البحر في أجواء خاصة وأنيقة. من المياه الصافية الكريستالية إلى الخدمات المميزة على متن القارب، تُقدم هذه الرحلة التوازن الأمثل بين الاسترخاء والمغامرة، مما يجعلها مثالية لقضاء عطلات رومانسية أو الاحتفال بمناسبات خاصة.',
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF6B7280),
                fontFamily: 'Madani Arabic',
                height: 1.8,
              ),
              textAlign: TextAlign.right,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(color: Color(0xFFF3F4F6)),
          ),
          SizedBox(height: 16.h),

          // ── Section 2: Features
          _buildSectionHeader('المميزات'),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                _buildCheckItem('مناظر ساحلية خلابة للبحر الأحمر'),
                SizedBox(height: 10.h),
                _buildCheckItem('معدات السلامة تشمل'),
                SizedBox(height: 10.h),
                _buildCheckItem('أماكن جلوس مريحة ومناطق مظللة'),
              ],
            ),
          ),

          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(color: Color(0xFFF3F4F6)),
          ),
          SizedBox(height: 16.h),

          // ── Section 3: Available Packages
          _buildSectionHeader('الباقات المتاحة'),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const ActivityPackageCard(
                  title: 'الباقة الأولى: تجربة غروب الشمس الفاخرة',
                  price: '2500',
                ),
                SizedBox(height: 16.h),
                const ActivityPackageCard(
                  title: 'الباقة الثانية: تجربة غروب الشمس الفاخرة',
                  price: '2500',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 4.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF5252),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(width: 8.w),

          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: Color(0xFFE5E7EB),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14.sp, color: AppColors.primary),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
