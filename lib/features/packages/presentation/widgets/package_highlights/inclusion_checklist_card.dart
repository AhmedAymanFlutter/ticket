import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'inclusion_ideal_card.dart';

class InclusionChecklistCard extends StatelessWidget {
  final bool withAccommodation;
  final List<String> inclusions;
  final List<String> exclusions;

  const InclusionChecklistCard({
    super.key,
    required this.withAccommodation,
    required this.inclusions,
    required this.exclusions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      constraints: BoxConstraints(minHeight: 100.h),
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
                ? _buildChecklistContent('تتضمن الباقة ما يلي:', inclusions)
                : _buildChecklistContent('لا تتضمن الباقة ما يلي:', exclusions),
          ),
          SizedBox(height: 16.h),
          const InclusionIdealCard(),
        ],
      ),
    );
  }

  Widget _buildChecklistContent(String title, List<String> items) {
    return Column(
      key: ValueKey(title),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            fontFamily: 'Madani Arabic',
          ),
        ),
        SizedBox(height: 8.h),
        if (items.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'لا توجد معلومات متوفرة',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontFamily: 'Madani Arabic',
              ),
            ),
          )
        else
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) => _buildCheckItem(items[index]),
          ),
      ],
    );
  }

  Widget _buildCheckItem(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20.w,
          height: 20.h,
          decoration: const BoxDecoration(
            color: Color(0xFFDCFCE7),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14.sp, color: const Color(0xFF16A34A)),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF1D2939),
              fontFamily: 'Madani Arabic',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
