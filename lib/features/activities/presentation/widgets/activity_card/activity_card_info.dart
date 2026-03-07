import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ActivityCardInfo extends StatelessWidget {
  final String title;
  final String durationText;
  final String confirmationText;
  final String locationText;

  const ActivityCardInfo({
    super.key,
    required this.title,
    required this.durationText,
    required this.confirmationText,
    required this.locationText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
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

        // Location Row
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
                locationText,
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
      ],
    );
  }
}
