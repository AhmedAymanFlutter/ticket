import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingBenefits extends StatelessWidget {
  final List<String> benefits;

  const BookingBenefits({super.key, required this.benefits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: benefits
          .map(
            (benefit) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: const BoxDecoration(
                      color: Color(0xFFECFDF3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Color(0xFF12B76A),
                      size: 14,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      benefit,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
