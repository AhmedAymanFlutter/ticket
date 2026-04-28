import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelPoliciesSection extends StatelessWidget {
  final HotelPoliciesEntity? policies;

  const HotelPoliciesSection({super.key, this.policies});

  @override
  Widget build(BuildContext context) {
    if (policies == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFE406F),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'السياسات',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF1D2939),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _buildPolicyItem(
                'تسجيل الوصول',
                'من: ${policies!.checkInFrom ?? "N/A"} - إلى: ${policies!.checkInUntil ?? "N/A"}',
                Icons.login_rounded,
              ),
              _buildPolicyItem(
                'تسجيل المغادرة',
                'من: ${policies!.checkOutFrom ?? "N/A"} - إلى: ${policies!.checkOutUntil ?? "N/A"}',
                Icons.logout_rounded,
              ),
              if (policies!.pets.isNotEmpty)
                _buildPolicyItem(
                  'الحيوانات الأليفة',
                  policies!.pets.join('\n'),
                  Icons.pets_rounded,
                ),
              if (policies!.internet.isNotEmpty)
                _buildPolicyItem(
                  'الإنترنت',
                  policies!.internet.join('\n'),
                  Icons.wifi_rounded,
                ),
              if (policies!.parking.isNotEmpty)
                _buildPolicyItem(
                  'موقف السيارات',
                  policies!.parking.join('\n'),
                  Icons.local_parking_rounded,
                ),
              if (policies!.rules.isNotEmpty)
                _buildPolicyItem(
                  'قواعد إضافية',
                  policies!.rules.join('\n'),
                  Icons.info_outline_rounded,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPolicyItem(String title, String content, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(10.w),
            child: Icon(
              icon,
              color: const Color(0xFFFE406F),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF1D2939),
                  ),
                ),
                SizedBox(height: 4.h),
                HtmlWidget(
                  content,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF667085),
                    height: 1.5,
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

