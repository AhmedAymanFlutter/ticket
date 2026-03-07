import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/home/presentation/widgets/GlassContainer_widgets.dart';
import 'package:ticket/features/home/presentation/widgets/home_header_categories.dart';
import 'package:ticket/features/home/presentation/widgets/home_search_bar.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h), // Top padding
          // Top Bar: Profile & Icons (Restored Glass Style)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile Section (Glass Style)
              GlassContainer(
                height: 60.h,
                width: 150.w,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.splashBackground,
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Image.asset(
                          'assets/photo/ticket_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'home.welcome'.tr(),
                            style: TextStyle(
                              fontFamily: 'Madani Arabic',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Ali 👋',
                            style: TextStyle(
                              fontFamily: 'Madani Arabic',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Icons Section (Glass Style)
              Row(
                children: [
                  GlassContainer(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GlassContainer(
                    height: 48.h,
                    width: 48.w,
                    padding: EdgeInsets.zero,
                    child: Icon(Icons.menu, color: Colors.white, size: 24.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          // Original Text Content
          Text(
            'home.travel_hotels_tours'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'home.transform_dreams'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.arefRuqaa().fontFamily,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'home.discover_desc'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyRegular.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),

          SizedBox(height: 24.h),

          // CTA Button
          Center(
            child: Container(
              width: 145.w,
              height: 48.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'home.explore_trip'.tr(),
                      style: AppTextStyle.button.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Search Bar
          const HomeSearchBar(),
          SizedBox(height: 24.h),
          // Categories
          const HomeHeaderCategories(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
