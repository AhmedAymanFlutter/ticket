import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildToggleItem({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
  required Widget icon,
  required bool isSelectedStyle,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: isSelected
              ? const Color(0xFF282A51).withOpacity(0.10)
              : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,

            SizedBox(width: 8.w),
            Text(
              title.tr(),
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF9E9E9E),
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: 'Madani Arabic',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
