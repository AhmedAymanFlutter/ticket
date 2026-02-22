import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsStatsSection extends StatelessWidget {
  const AboutUsStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Column(
        children: [
          _StatItem(
            icon: SvgPicture.asset(
              'assets/icons/user-group.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            count: 'about.stats_customers_count'.tr(),
            label: 'about.stats_customers_label'.tr(),
          ),
          SizedBox(height: 56.h),
          _StatItem(
            icon: SvgPicture.asset(
              'assets/photo/time.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            count: 'about.stats_experience_count'.tr(),
            label: 'about.stats_experience_label'.tr(),
          ),
          SizedBox(height: 56.h),
          _StatItem(
            icon: SvgPicture.asset(
              'assets/photo/time.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            count: 'about.stats_destinations_count'.tr(),
            label: 'about.stats_destinations_label'.tr(),
          ),
          SizedBox(height: 56.h),
          _StatItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            count: 'about.stats_satisfaction_count'.tr(),
            label: 'about.stats_satisfaction_label'.tr(),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final Widget icon;
  final String count;
  final String label;

  const _StatItem({
    required this.icon,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52.w,
          height: 52.w,
          decoration: const BoxDecoration(
            color: Color(0xFF282A50),
            shape: BoxShape.circle,
          ),
          child: Center(child: icon),
        ),
        SizedBox(height: 16.h),
        Text(
          count,
          style: TextStyle(
            color: const Color(0xFF282A50),
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Madani Arabic',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF9E9E9E),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Madani Arabic',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
