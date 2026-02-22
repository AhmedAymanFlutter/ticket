import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Profile Image (Right)
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.r),
              image: const DecorationImage(
                image: AssetImage('assets/photo/image (1).png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          /// Name & Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'more.user_name'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF161616),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'more.user_email'.tr(),
                  style: TextStyle(
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    fontSize: 12.sp,
                    color: const Color(0xFF333333),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          /// Edit Icon (Left)
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/edite.svg',
              width: 40.w,
              height: 40.h,
              colorFilter: ColorFilter.mode(
                AppColors.splashBackground,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
