import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'home.search_destination'.tr(),
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
            fontFamily: 'Madani Arabic',
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 24.sp),
          suffixIcon: Container(
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.tune, color: Colors.white, size: 18.sp),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
        ),
      ),
    );
  }
}
