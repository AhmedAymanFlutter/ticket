import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsMissionSection extends StatelessWidget {
  const AboutUsMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'about.mission_title'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          _MissionListItem(
            label: 'about.mission_item_1'.tr(),
            icon: Icon(Icons.check, color: Colors.white, size: 24.sp),
          ),
          _MissionListItem(
            label: 'about.mission_item_2'.tr(),
            icon: SvgPicture.asset(
              'assets/icons/user-group.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          _MissionListItem(
            label: 'about.mission_item_3'.tr(),
            icon: SvgPicture.asset(
              'assets/icons/earth.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          _MissionListItem(
            label: 'about.mission_item_4'.tr(),
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionListItem extends StatelessWidget {
  final String label;
  final Widget icon;

  const _MissionListItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(width: 16.w),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
        ],
      ),
    );
  }
}
