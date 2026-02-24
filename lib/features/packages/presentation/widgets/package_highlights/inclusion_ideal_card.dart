import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InclusionIdealCard extends StatelessWidget {
  const InclusionIdealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'مثالي للمسافرين',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D2939),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.star_rounded,
                color: const Color(0xFFFFC107),
                size: 24.sp,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'تشمل هذه الباقة كل ما تحتاجه لقضاء عطلة مريحة وخالية من المتاعب. أقم في فنادق من فئة 4-5 نجوم مع وجبة إفطار يومية واستمتع بجميع الجولات السياحية المصحوبة بمرشدين.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF475467),
              fontFamily: 'Madani Arabic',
              height: 1.7,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
