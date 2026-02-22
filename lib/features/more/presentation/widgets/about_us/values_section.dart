import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsValuesSection extends StatelessWidget {
  const AboutUsValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ValuesHeader(),
        SizedBox(height: 16.h),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/defender.svg'),
          title: 'about.value_1_title'.tr(),
          description: 'about.value_1_desc'.tr(),
        ),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/tamuse.svg'),
          title: 'about.value_2_title'.tr(),
          description: 'about.value_2_desc'.tr(),
        ),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/heart3.svg'),
          title: 'about.value_3_title'.tr(),
          description: 'about.value_3_desc'.tr(),
        ),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/smart.svg'),
          title: 'about.value_4_title'.tr(),
          description: 'about.value_4_desc'.tr(),
        ),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/time.svg'),
          title: 'about.value_5_title'.tr(),
          description: 'about.value_5_desc'.tr(),
        ),
        _ValueCard(
          icon: _buildSvgIcon('assets/photo/world.svg'),
          title: 'about.value_6_title'.tr(),
          description: 'about.value_6_desc'.tr(),
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
      colorFilter: const ColorFilter.mode(
        Color(0xFF282A50), // Navy/Dark color for these icons based on image
        BlendMode.srcIn,
      ),
      // Fallback if icon not found to prevent crash during development
      placeholderBuilder: (context) =>
          Icon(Icons.help_outline, color: const Color(0xFF282A50), size: 32.sp),
    );
  }
}

class _ValuesHeader extends StatelessWidget {
  const _ValuesHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'about.values_subtitle'.tr(),
            style: TextStyle(
              color: const Color(0xFF9E9E9E),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'about.values_title'.tr(),
            style: TextStyle(
              color: const Color(0xFF282A50),
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Container(
            width: 80.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFE406F),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;

  const _ValueCard({
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
        crossAxisAlignment: CrossAxisAlignment.start, // Right aligned icons
        children: [
          Container(
            width: 55.w,
            height: 55.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6), // Light gray bg for these icons
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: icon,
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF282A50),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              color: const Color(0xFF9E9E9E),
              fontSize: 14.sp,
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
