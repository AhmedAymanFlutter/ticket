import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  Widget _buildAvatar(String path) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 6.w),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'home.traveler_reviews'.tr(),
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF161616),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'home.traveler_reviews_desc'.tr(),
                style: GoogleFonts.manrope(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF333333),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Rating Card
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: InkWell(
            onTap: () {
              // Navigate to all reviews screen if needed
            },
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF282A51),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 16,
                    offset: const Offset(2, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(24.r),
                image: const DecorationImage(
                  image: AssetImage('assets/photo/rating.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Google Logo and Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/google.svg',
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(width: 8.w),

                      Text(
                        'تقييماتنا على ',
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Google',
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Overlapping Avatars
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 144.w,
                      height: 48.w,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: _buildAvatar('assets/photo/image (1).png'),
                          ),
                          Positioned(
                            right: 32.w,
                            child: _buildAvatar(
                              'assets/photo/home_cobonant.png',
                            ),
                          ),
                          Positioned(
                            right: 64.w,
                            child: _buildAvatar('assets/photo/onboarding.jpeg'),
                          ),
                          Positioned(
                            right: 96.w,
                            child: Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(
                                  0xFF4267B2,
                                ), // Distinct blue for count
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.w,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '15K',
                                style: TextStyle(
                                  fontFamily: 'Madani Arabic',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Title text
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'تجارب حقيقية من عملائنا',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Description text
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'اكتشف تجارب عملائنا الحقيقية وتقييماتهم لرحلاتنا، واطمئن لجودة خدماتنا من خلال آراء موثوقة.',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Bottom Browse button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'تصفح التقييمات',
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFCCCDE6),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFCCCDE6),
                        size: 24.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
