import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildHeroCard({
  required String name,
  required String location,
  required String image,
}) {
  return Container(
    width: 343.w,
    height: 385.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Background Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
            image,
            width: 343.w,
            height: 385.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 343.w,
                height: 385.h,
                color: Colors.grey[300],
                child: const Icon(Icons.error_outline, color: Colors.red),
              );
            },
          ),
        ),
        // Price Badge
        Positioned(
          top: 16.h,
          left: 16.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF5252), Color(0xFFFD6B38)],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '1836 د.أ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Madani Arabic',
              ),
            ),
          ),
        ),
        // Gradient Overlay
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
        ),
        // Content Overlay
        Positioned(
          bottom: 24.h,
          right: 16.w,
          left: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Madani Arabic',
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Madani Arabic',
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
