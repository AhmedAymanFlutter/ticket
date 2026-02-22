import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.asset(
                  'assets/photo/image (1).png', // Sample image
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Best Choice Badge
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282A51).withOpacity(0.66),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'activities.best_choice'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'activities.boat_trip_title'.tr(),
                  style: TextStyle(
                    color: const Color(0xFF1A1A1A),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
                SizedBox(height: 12.h),

                // Info Row (Duration, Confirmation)
                Row(
                  children: [
                    Text(
                      'activities.duration_2h'.tr(),
                      style: TextStyle(
                        color: const Color(0xFF404040),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'activities.instant_confirmation'.tr(),
                      style: TextStyle(
                        color: const Color(0xFF404040),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Location Row (Icon to the Left/Right based on Locale)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'activities.location_jeddah'.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF828282),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Madani Arabic',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                const Divider(height: 1, color: Color(0xFFEAE9EB)),
                SizedBox(height: 16.h),

                // Price and Rating Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating (Right side in design)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: const Color(0xFFFFB800),
                          size: 24.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          ' (570) 4,6 ',
                          style: TextStyle(
                            color: const Color(0xFF8A8A8A),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    // Price (Left side in design)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'activities.starting_from'.tr(),
                                style: TextStyle(
                                  color: const Color(0xFF1A1A1A),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.ibmPlexSansArabic()
                                      .fontFamily,
                                ),
                              ),
                              TextSpan(
                                text: '2500 ',
                                style: TextStyle(
                                  color: const Color(0xFF1A1A1A),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.ibmPlexSansArabic()
                                      .fontFamily,
                                ),
                              ),
                              TextSpan(
                                text: '${'activities.currency_sar'.tr()} ',
                                style: TextStyle(
                                  color: const Color(0xFF1A1A1A),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.ibmPlexSansArabic()
                                      .fontFamily,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
