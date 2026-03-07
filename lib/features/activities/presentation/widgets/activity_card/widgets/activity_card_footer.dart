import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCardFooter extends StatelessWidget {
  final int ratingCount;
  final num ratingAvg;
  final num priceAmount;

  const ActivityCardFooter({
    super.key,
    required this.ratingCount,
    required this.ratingAvg,
    required this.priceAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
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

        // Price
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
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    ),
                  ),
                  TextSpan(
                    text: '$priceAmount ',
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    ),
                  ),
                  TextSpan(
                    text: '${'activities.currency_sar'.tr()} ',
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
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
    );
  }
}
