import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSocialButton(IconData? icon, Color bgColor, {Widget? child}) {
  return Container(
    width: 56.w,
    height: 56.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: bgColor,
      border: Border.all(color: Colors.grey[300]!, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: child ?? Icon(icon, color: Colors.white, size: 24.sp),
  );
}
