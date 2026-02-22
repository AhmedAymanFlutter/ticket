import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsFeaturesSection extends StatelessWidget {
  const AboutUsFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _AchievementHeader(),
        SizedBox(height: 16.h),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/trophy.svg'),
          title: 'about.achievement_1_title'.tr(),
          description: 'about.achievement_1_desc'.tr(),
        ),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/world.svg'),
          title: 'about.achievement_2_title'.tr(),
          description: 'about.achievement_2_desc'.tr(),
        ),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/profile.svg'),
          title: 'about.achievement_3_title'.tr(),
          description: 'about.achievement_3_desc'.tr(),
        ),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/heart2.svg'),
          title: 'about.achievement_4_title'.tr(),
          description: 'about.achievement_4_desc'.tr(),
        ),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/meddel.svg'),
          title: 'about.achievement_5_title'.tr(),
          description: 'about.achievement_5_desc'.tr(),
        ),
        _AchievementCard(
          icon: _buildSvgIcon('assets/photo/star.svg'),
          title: 'about.achievement_6_title'.tr(),
          description: 'about.achievement_6_desc'.tr(),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildSvgIcon(String path) {
    return SvgPicture.asset(
      path,
      width: 48.w,
      height: 48.h,
      fit: BoxFit.scaleDown,
      colorFilter: const ColorFilter.mode(Color(0xFFFE406F), BlendMode.srcIn),
    );
  }
}

class _AchievementHeader extends StatelessWidget {
  const _AchievementHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'about.why_us_subtitle'.tr(),
            style: TextStyle(
              color: const Color(0xFF282A50),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'about.why_us_title'.tr(),
            style: TextStyle(
              color: const Color(0xFF282A50),
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Container(
            width: 80.w,
            height: 4.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
              ),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;

  const _AchievementCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55.w,
            height: 55.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: icon,
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF282A50),
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: TextStyle(
              color: const Color(0xFF9E9E9E),
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
