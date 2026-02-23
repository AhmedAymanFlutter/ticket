import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDotsIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _dot(false),
      SizedBox(width: 8.w),
      _dot(true),
      SizedBox(width: 8.w),
      _dot(false),
    ],
  );
}

Widget _dot(bool active) {
  return Container(
    width: active ? 24.w : 12.w,
    height: 12.h,
    decoration: BoxDecoration(
      color: active ? const Color(0xFFFF5252) : const Color(0xFFFFECEC),
      borderRadius: BorderRadius.circular(6.r),
    ),
  );
}
