import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/tours/data/models/tour_details_model.dart';

class ActivityMainInfo extends StatelessWidget {
  final TourDetailsModel? tour;
  const ActivityMainInfo({super.key, this.tour});

  @override
  Widget build(BuildContext context) {
    // Dynamic data from tour details
    final String locationStr =
        '${tour?.cityName ?? 'جدة'}، ${tour?.timeZone?.split('/').first ?? 'المملكة العربية السعودية'}';
    final String titleStr = tour?.title ?? 'رحلة بحرية فاخرة على الساحل لشخصين';
    final num ratingAvg = tour?.ratingAverage ?? 4.6;
    final int ratingCount = tour?.ratingCount ?? 70;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Location
          Text(
            locationStr,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.h),

          // ── Title
          Text(
            titleStr,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
              height: 1.4,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.h),

          // ── Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$ratingAvg من $ratingCount تقييماً',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.star, color: Colors.amber, size: 18.sp),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Feature Tags
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              if (tour?.pricingInfo?.type != null)
                _buildFeatureChip(tour!.pricingInfo!.type!),
              if (tour?.itinerary?.fixedDurationInMinutes != null)
                _buildFeatureChip(
                  '${tour!.itinerary!.fixedDurationInMinutes! ~/ 60} ساعات',
                ),
              if (tour?.cancellationPolicy?.type != null)
                _buildFeatureChip(tour!.cancellationPolicy!.type!),
              // Fallback default chips if no data
              if (tour == null) ...[
                _buildFeatureChip('شخصان بالغان'),
                _buildFeatureChip('3 ساعات'),
                _buildFeatureChip('إلغاء مجاني'),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F6F0),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xFF10B981),
          fontWeight: FontWeight.w500,
          fontFamily: 'Madani Arabic',
        ),
      ),
    );
  }
}
