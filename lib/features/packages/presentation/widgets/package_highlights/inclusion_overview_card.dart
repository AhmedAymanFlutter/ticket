import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class InclusionOverviewCard extends StatelessWidget {
  const InclusionOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      constraints: BoxConstraints(minHeight: 268.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFE5653).withOpacity(0.04),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFFE5653).withOpacity(0.02),
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'نظرة عامة على الباقات',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'استمتع برحلة رمضانية مميزة لمدة ثمانية أيام في ماليزيا، تجمع بين الثقافة والتراث وجمال الجزر. تبدأ الرحلة في كوالالمبور برحلة خاصة للراحة والاسترخاء. ثم تكتشف أبرز معالم المدينة والأسواق الرمضانية المسائية. اكتشف كهوف باتو ومعبد تيان هو قبل التوجه جواً إلى بينانج للتجول في شوارعها التاريخية والاستمتاع بتجارب إفطار مميزة على شاطئ البحر. تم تابع رحلتك إلى لانكاوي لركوب التلفريك، والاستمتاع بالمناظر الخلابة، وخوض مغامرات الجزيرة. مع قضاء فترة ما بعد الظهر والمساء في الاسترخاء، تختتم الرحلة برحلة خاصة إلى مطار لانكاوي الدولي، حاملاً معك ذكريات لا تُنسى من ماليزيا خلال شهر رمضان.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              height: 1.6,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
