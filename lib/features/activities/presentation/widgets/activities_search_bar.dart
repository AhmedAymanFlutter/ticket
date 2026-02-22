import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesSearchBar extends StatelessWidget {
  const ActivitiesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          // Search Input
          Expanded(
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: const Color(0xFFD9D7DB), width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[400], size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'activities.search_hint'.tr(),
                        hintStyle: TextStyle(
                          color: const Color(0xFF9E9E9E),
                          fontSize: 12.sp,
                          fontFamily: 'Madani Arabic',
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          // Search Button
          Container(
            width: 83.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFF282A51),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text(
                'activities.search_button'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
