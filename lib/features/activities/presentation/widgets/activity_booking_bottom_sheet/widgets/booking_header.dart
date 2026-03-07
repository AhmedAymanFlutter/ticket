import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class BookingHeader extends StatelessWidget {
  final String title;

  const BookingHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        // ── Grab Handle
        Container(
          width: 40.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 16.h),
        // ── Header Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.grey, size: 16.sp),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'Madani Arabic',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
