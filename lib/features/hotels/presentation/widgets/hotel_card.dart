import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String distance;
  final int price;
  final String tag;
  final String discount;

  const HotelCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.distance,
    required this.price,
    required this.tag,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 204
          .h, // Assuming height provided in prompt (204) matches this or close
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
      ),
      child: Stack(
        children: [
          Row(
            // In RTL: Image (Right) -> Content (Left)
            children: [
              // Image Section (Right in RTL)
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.r),
                    bottomStart: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Content Section (Left in RTL)
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tag
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // Actually tag is usually at start.
                        // The badge is at Top-Left (End in RTL). Tag is likely Top-Right (Start).
                        // Let's keep Tag flow normal (Start) and Badge absolute (End).
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F1FF), // Light Blue
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF161616),
                              ),
                            ),
                          ),
                        ],
                      ),

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

                      // Location
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'Madani Arabic',
                              fontSize: 12.sp,
                              color: const Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),

                      // Distance
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/map.svg',
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              distance,
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF8E8E93),
                              ),
                              maxLines: 1,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      // Price & Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$price',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.ibmPlexSansArabic()
                                              .fontFamily,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF161616),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'common.price_sar'.tr(),
                                    style: TextStyle(
                                      fontFamily: 'Madani Arabic',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF161616),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'common.per_night'.tr(), // "/ Night"
                                style: TextStyle(
                                  fontFamily: 'Madani Arabic',
                                  fontSize: 10.sp,
                                  color: const Color(0xFF8E8E93),
                                ),
                              ),
                            ],
                          ),
                          // Explore Button
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF282A51),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'common.explore'.tr(), // "Istikshif"
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Discount Badge (Top Left of Card Content)
          if (discount.isNotEmpty)
            Positioned(
              top: 12.h,
              left: 12.w, // Visually Top-Left of the card
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE31E24), // Red
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  discount,
                  style: TextStyle(
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
