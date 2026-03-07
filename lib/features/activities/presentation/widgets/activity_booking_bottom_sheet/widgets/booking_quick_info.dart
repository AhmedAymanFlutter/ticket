import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BookingQuickInfo extends StatelessWidget {
  const BookingQuickInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 5.w),
            Icon(Icons.bolt, color: Colors.amber, size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              'تاكيد فوري',
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF6B7280),
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(width: 20.w),
            SvgPicture.asset(
              'assets/icons/smartphone.svg',
              width: 16.w,
              height: 16.h,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 4.w),
            Text(
              'عرض التذكرة عبر الهاتف المحمول أو طباعتها',
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF6B7280),
                fontFamily: 'Madani Arabic',
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const Divider(
          height: 1,
          color: Color(0xFFF3F4F6),
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }
}
