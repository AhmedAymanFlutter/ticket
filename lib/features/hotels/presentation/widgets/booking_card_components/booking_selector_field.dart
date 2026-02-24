import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingSelectorField extends StatelessWidget {
  final String label;
  final String? text;
  final String? iconPath;

  const BookingSelectorField({
    super.key,
    required this.label,
    this.text,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF344054),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Madani Arabic',
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 49.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.6.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (iconPath != null) ...[
                    SvgPicture.asset(
                      iconPath!,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF98A2B3),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                  if (text != null)
                    Text(
                      text!,
                      style: TextStyle(
                        color: const Color(0xFF101828),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF98A2B3)),
            ],
          ),
        ),
      ],
    );
  }
}
