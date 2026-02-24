import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'inclusion_ideal_card.dart';

class InclusionChecklistCard extends StatelessWidget {
  final bool withAccommodation;

  const InclusionChecklistCard({super.key, required this.withAccommodation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      constraints: BoxConstraints(minHeight: 353.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1.w),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 8),
            blurRadius: 10,
            spreadRadius: -6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: withAccommodation
                ? _buildWithAccommodationContent()
                : _buildWithoutAccommodationContent(),
          ),
          SizedBox(height: 16.h),
          const InclusionIdealCard(),
        ],
      ),
    );
  }

  Widget _buildWithAccommodationContent() {
    return Column(
      key: const ValueKey('with'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تتضمن الاقامة الكاملة ما يلي:',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            fontFamily: 'Madani Arabic',
          ),
        ),
        SizedBox(height: 8.h),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 4,
          children: [
            _buildCheckItem('الإقامة الفندقية'),
            _buildCheckItem('إفطار يومي'),
            _buildCheckItem('خدمات مرشد سياحي'),
            _buildCheckItem('جولات سياحية'),
            _buildCheckItem('النقل من وإلى المطار'),
            _buildCheckItem('تامين السفر'),
          ],
        ),
      ],
    );
  }

  Widget _buildWithoutAccommodationContent() {
    return Column(
      key: const ValueKey('without'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تتضمن الباقة بدون إقامة ما يلي:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
            fontFamily: 'Madani Arabic',
          ),
        ),
        SizedBox(height: 8.h),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 4,
          children: [
            _buildCheckItem('جولات سياحية'),
            _buildCheckItem('خدمات مرشد سياحي'),
            _buildCheckItem('النقل من وإلى المطار'),
            _buildCheckItem('تامين السفر'),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckItem(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: const BoxDecoration(
            color: Color(0xFFDCFCE7),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 16.sp, color: const Color(0xFF16A34A)),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF1D2939),
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
