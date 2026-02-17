import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/home/presentation/widgets/GlassContainer_widgets.dart';
import 'package:ticket/features/home/presentation/widgets/home_header_carousel.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // viewportFraction 0.5 to keep items closer
    _pageController = PageController(viewportFraction: 0.5);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.h, // Increased height to accommodate carousel
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Positioned.fill(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                  child: Image.asset(
                    'assets/photo/home_cobonant.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // Gradient Overlay
              ],
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h), // Top padding
                // Top Bar: Language & Profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile / Greeting
                    GlassContainer(
                      height: 60.h,
                      width: 150.w,
                      child: Row(
                        children: [
                          // Avatar
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor: AppColors.splashBackground,
                            child: Image.asset(
                              'assets/photo/ticket.png',
                              fit: BoxFit.cover,
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
                                SizedBox(height: 4.h),
                                Text(
                                  'home.your_adventure'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Madani Arabic',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
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
                    // Language Button
                    GestureDetector(
                      onTap: () async {
                        if (context.locale.languageCode == 'ar') {
                          await context.setLocale(const Locale('en'));
                        } else {
                          await context.setLocale(const Locale('ar'));
                        }
                      },
                      child: GlassContainer(
                        height: 40.h,
                        width: 80.w, // Increased width slightly for English
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.locale.languageCode == 'ar'
                                  ? 'العربية'
                                  : 'English',
                              style: AppTextStyle.bodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 80.h),

                // Center Text
                Text(
                  'home.travel_hotels_tours'.tr(),
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.white,
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
                Container(
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

                SizedBox(height: 50.h),
              ],
            ),
          ),

          // Carousel Section
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Carousel
                HomeHeaderCarousel(pageController: _pageController),

                SizedBox(height: 20.h),

                // Controls (Pagination / IDK what "01" is, assuming page number or just decoration)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Directionality(
                    textDirection:
                        ui.TextDirection.ltr, // Force LTR for controls
                    child: Row(
                      children: [
                        Text(
                          '0${_currentPage + 1}',
                          style: TextStyle(
                            fontFamily: 'Madani Arabic',
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // Progress Bar Line
                        Expanded(
                          child: Container(
                            height: 2.h,
                            color: Colors.white.withOpacity(0.5),
                            child: FractionallySizedBox(
                              alignment: AlignmentDirectional.centerStart,
                              widthFactor:
                                  (_currentPage + 1) / 4, // Assuming 4 items
                              child: Container(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // Navigation Buttons
                        Row(
                          children: [
                            _buildNavButton(
                              icon: Icons.arrow_back_ios_new,
                              onTap: _previousPage,
                            ),
                            SizedBox(width: 12.w),
                            _buildNavButton(
                              icon: Icons.arrow_forward_ios,
                              onTap: _nextPage,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
          // color: Colors.transparent, // Default
        ),
        child: Icon(icon, color: Colors.white, size: 16.sp),
      ),
    );
  }
}
