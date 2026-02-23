import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet.dart';

class ActivityBottomActions extends StatelessWidget {
  const ActivityBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16.h,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Offer Details Header
          Row(
            children: [
              Text(
                'تفاصيل العرض',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Madani Arabic',
                ),
              ),
              const Spacer(),
              Icon(Icons.history, color: Colors.grey, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                'احجز اليوم',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 12.w),
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
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: Color(0xFFF3F4F6)),
          SizedBox(height: 12.h),

          // ── Price and Action Button
          Row(
            children: [
              Text(
                'السعر الإجمالي',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Madani Arabic',
                ),
              ),
              const Spacer(),
              // Price (displayed on the left side of the row in RTL)
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '1836',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF5252),
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '﷼',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF5252),
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Gradient Availability Button
          Container(
            width: double.infinity,
            height: 54.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF5252), Color(0xFFFF8952)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => const ActivityBookingBottomSheet(),
                  );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Center(
                  child: Text(
                    'تحقق من التوفر',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
