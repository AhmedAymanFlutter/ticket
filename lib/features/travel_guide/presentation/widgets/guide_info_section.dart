import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_info_card.dart';
import '../../data/models/country_model.dart';

/// The main information section container for the Tour Guide Details page.
/// It includes a section title with a red indicator, a description text,
/// and a list of detailed information cards (Time, Visa, Duration).
class GuideInfoSection extends StatelessWidget {
  final CountryModel? country;
  const GuideInfoSection({super.key, this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 16.h),
          // ── Section Header with red bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'معلومات الوجهة',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'Madani Arabic',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 4.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5252),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // ── Description Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              country?.description ?? 'جاري تحميل الوصف...',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6B7280),
                fontFamily: 'Madani Arabic',
                height: 1.8,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 20.h),
          // ── Info Cards Column
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const GuideInfoCard(
                  icon: Icons.calendar_today_outlined,
                  title: 'أفضل الأوقات لزيارة',
                  description:
                      'تختلف الأوقات المناسبة للزيارة حسب التفضيلات الشخصية والأنشطة المخطط لها.',
                ),
                SizedBox(height: 12.h),
                const GuideInfoCard(
                  icon: Icons.description_outlined,
                  title: 'المستندات المطلوبة للتأشيرة',
                  description:
                      'تحتاج عادةً إلى جواز سفر ساري المفعول وتأمين طبي وصور شخصية.',
                ),
                SizedBox(height: 12.h),
                const GuideInfoCard(
                  icon: Icons.timer_outlined,
                  title: 'مدة الرحلة',
                  description:
                      'المدة المقترحة لاستكشاف أبرز المعالم تتراوح عادةً بين 5 إلى 10 أيام.',
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
