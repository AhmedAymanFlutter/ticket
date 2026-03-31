import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFFE0E0E0), // Subtle grey border
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.h,
          bottom: 8.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: const Color(0xFF9E9E9E),
              size: 18.sp,
            ),
            SizedBox(width: 8.w), // Gap: 8px
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'home.search_destination'.tr(),
                  hintStyle: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 14.sp,
                    fontFamily: 'Madani Arabic',
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(width: 8.w), // Gap: 8px
            Icon(
              Icons.tune,
              color: const Color(0xFF9E9E9E),
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

