import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InclusionToggleButtons extends StatelessWidget {
  final bool withAccommodation;
  final ValueChanged<bool> onChanged;

  const InclusionToggleButtons({
    super.key,
    required this.withAccommodation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // "مع توفير إقامة" button
        GestureDetector(
          onTap: () => onChanged(true),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: withAccommodation
                  ? const LinearGradient(
                      colors: [Color(0xFFFF5252), Color(0xFFFD6B38)],
                    )
                  : null,
              color: withAccommodation ? null : Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: !withAccommodation
                  ? Border.all(color: const Color(0xFFE5E7EB), width: 1)
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: withAccommodation
                        ? Colors.white.withOpacity(0.2)
                        : const Color(0xFFF3F4F6),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/hotel.svg',
                    width: 24.sp,
                    height: 24.sp,
                  ),
                ),
                Text(
                  'مع توفير إقامة',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: withAccommodation
                        ? Colors.white
                        : const Color(0xFF6B7280),
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // "بدون إقامة" button
        GestureDetector(
          onTap: () => onChanged(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: !withAccommodation
                  ? const LinearGradient(
                      colors: [Color(0xFFFF5252), Color(0xFFFD6B38)],
                    )
                  : null,
              color: !withAccommodation ? null : Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: withAccommodation
                  ? Border.all(color: const Color(0xFFE5E7EB), width: 1)
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: !withAccommodation
                        ? Colors.white.withOpacity(0.2)
                        : const Color(0xFFF3F4F6),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/map.svg',
                    width: 18.sp,
                    height: 18.sp,
                    colorFilter: ColorFilter.mode(
                      !withAccommodation
                          ? Colors.white
                          : const Color(0xFF6B7280),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'بدون اقامه',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: !withAccommodation
                        ? Colors.white
                        : const Color(0xFF6B7280),
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
