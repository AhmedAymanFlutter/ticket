import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

Widget buildField({
  required String label,
  required String hint,
  Widget? icon,
  String? svgPath,
  double? width,
  Widget? insideIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (svgPath != null)
            SvgPicture.asset(
              svgPath,
              width: 14.w,
              height: 14.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1D1B20),
                BlendMode.srcIn,
              ),
            )
          else
            ?icon,
          SizedBox(width: 4.w),
          Text(
            label.tr(),
            style: TextStyle(
              color: const Color(0xFF1D1B20),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Madani Arabic',
            ),
          ),
        ],
      ),
      SizedBox(height: 6.h),
      Container(
        width: width,
        height: 36.h,
        padding: EdgeInsets.only(top: 4.h, right: 8.w, bottom: 4.h, left: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFEAE9EB)),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          textDirection: ui.TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                hint.tr(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF9E9E9E),
                  fontSize: 11.sp, // Adjusted to fit height
                  fontFamily: 'Madani Arabic',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            insideIcon ??
                Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF9E9E9E),
                  size: 18.sp,
                ),
          ],
        ),
      ),
    ],
  );
}
