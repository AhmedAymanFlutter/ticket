import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/utils/app_colors.dart';

class HotelFilterSection extends StatelessWidget {
  const HotelFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 62.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          top: BorderSide(color: const Color(0xFFF3F4F6), width: 1.6.w),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 8),
            blurRadius: 10,
            spreadRadius: -6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'تصفية الغرف والخدمات',
            style: TextStyle(
              color: const Color(0xFF101828),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
            ),
          ),
          // Filter Button
          Container(
            width: 97.w,
            height: 44.h,
            decoration: BoxDecoration(
              gradient: AppColors.secondary,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 10),
                  blurRadius: 15,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/filter.svg',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),

                Text(
                  'تصفيه',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
