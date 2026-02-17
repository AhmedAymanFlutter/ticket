import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOfferCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int days;
  final int price;
  final String type;

  const SpecialOfferCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.days,
    required this.price,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 205.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12.r),
              bottomStart: Radius.circular(12.r),
            ),
            child: Image.asset(
              imagePath,
              width: 130.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF161616),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Description & Price combined
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$description ',
                          style: TextStyle(
                            fontFamily: 'Madani Arabic',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1A1A1A),
                            height: 2,
                          ),
                        ),
                        TextSpan(
                          text: '$price ',
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.ibmPlexSansArabic().fontFamily,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFF5252),
                            height: 2.4,
                          ),
                        ),
                        TextSpan(
                          text: 'common.price_sar'.tr(),
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.ibmPlexSansArabic().fontFamily,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFF5252),
                            height: 2.4,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Type And View Details
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/flight.svg',
                        width: 16.w,
                        height: 16.h,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF8E8E93),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        type,
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 12.sp,
                          color: const Color(0xFF8E8E93),
                        ),
                      ),
                    ],
                  ),

                  // View Details
                  Text(
                    'common.view_details'.tr(),
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF282A51),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
