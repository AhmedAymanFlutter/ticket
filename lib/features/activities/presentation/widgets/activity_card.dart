import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/activities/presentation/pages/activity_details_view.dart';
import 'package:ticket/features/tours/data/models/tour_model.dart';

class ActivityCard extends StatelessWidget {
  final TourModel? tour;
  const ActivityCard({super.key, this.tour});

  @override
  Widget build(BuildContext context) {
    // Determine dynamic properties from the tour model.
    final String imageUrl = tour?.coverImage ?? '';
    final String titleStr = tour?.title ?? 'activities.boat_trip_title'.tr();
    final String locationStr =
        tour?.cityName ?? 'activities.location_jeddah'.tr();
    final num ratingAvg = tour?.ratingAverage ?? 4.6;
    final int ratingCount = tour?.ratingCount ?? 570;
    final num priceAmount = tour?.priceAmount ?? 2500;

    // We maintain default text translations if properties are empty
    final String durationText = 'activities.duration_2h'.tr();
    final String confirmationText =
        tour?.cancellationPolicy ?? 'activities.instant_confirmation'.tr();
    return InkWell(
      onTap: () {
        if (tour?.productCode != null) {
          FadeNavigation.pushFade(
            context,
            ActivityDetailsView(productCode: tour!.productCode!),
          );
        }
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: imageUrl.startsWith('http')
                      ? Image.network(
                          imageUrl,
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.asset(
                            'assets/photo/image (1).png', // Sample image fallback
                            height: 200.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
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
                    titleStr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                        durationText,
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
                      Expanded(
                        child: Text(
                          confirmationText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF404040),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Madani Arabic',
                          ),
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
                          locationStr,
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
                            ' ($ratingCount) $ratingAvg ',
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
                                  text: '$priceAmount ',
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
      ),
    );
  }
}
