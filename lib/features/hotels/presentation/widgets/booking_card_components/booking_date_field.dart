import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDateField extends StatelessWidget {
  final String label;
  final String iconPath;

  const BookingDateField({
    super.key,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF1A1A1A),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Madani Arabic',
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.6.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF98A2B3),
                  BlendMode.srcIn,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
