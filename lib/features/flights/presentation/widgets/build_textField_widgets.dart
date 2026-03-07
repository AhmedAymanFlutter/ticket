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
  VoidCallback? onTap,
  TextEditingController? controller,
  bool readOnly = true,
  String? value,
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
      GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: width,
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                child: controller != null
                    ? TextField(
                        controller: controller,
                        readOnly: readOnly,
                        onTap: onTap,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF1D1B20),
                          fontSize: 11.sp,
                          fontFamily: 'Madani Arabic',
                        ),
                        decoration: InputDecoration(
                          hintText: hint.tr(),
                          hintStyle: TextStyle(
                            color: const Color(0xFF9E9E9E),
                            fontSize: 11.sp,
                            fontFamily: 'Madani Arabic',
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      )
                    : Text(
                        value ?? hint.tr(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: value != null
                              ? const Color(0xFF1D1B20)
                              : const Color(0xFF9E9E9E),
                          fontSize: 11.sp,
                          fontFamily: 'Madani Arabic',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
              if (insideIcon != null)
                insideIcon
              else if (onTap != null || controller != null)
                Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF9E9E9E),
                  size: 18.sp,
                ),
            ],
          ),
        ),
      ),
    ],
  );
}
