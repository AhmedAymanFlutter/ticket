import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelAmenities extends StatelessWidget {
  final List<String>? facilities;
  const HotelAmenities({super.key, this.facilities});

  @override
  Widget build(BuildContext context) {
    final displayFacilities =
        facilities ?? List.generate(6, (index) => 'Loading...');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _buildHeader(),
        ),
        SizedBox(height: 16.h),
        _buildAmenitiesContainer(displayFacilities),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
          'المرافق الرئيسية',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Madani Arabic',
            color: const Color(0xFF1D2939),
          ),
        ),
      ],
    );
  }

  Widget _buildAmenitiesContainer(List<String> labels) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Wrap(
        spacing: 16.w,
        runSpacing: 16.h,
        alignment: WrapAlignment.start,
        children: labels.map((label) => _buildAmenityCard(_getIconForFacility(label), label)).toList(),
      ),
    );
  }

  Widget _buildAmenityCard(IconData icon, String label) {
    return Container(
      width: 95.w,
      height: 85.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFFE406F), size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF1D2939),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  IconData _getIconForFacility(String facility) {
    facility = facility.toLowerCase();
    if (facility.contains('wifi') || facility.contains('internet')) return Icons.wifi_rounded;
    if (facility.contains('pool')) return Icons.pool_rounded;
    if (facility.contains('parking')) return Icons.directions_car_filled_rounded;
    if (facility.contains('spa')) return Icons.spa_rounded;
    if (facility.contains('gym') || facility.contains('fitness')) return Icons.fitness_center_rounded;
    if (facility.contains('restaurant') || facility.contains('dining')) return Icons.restaurant_rounded;
    if (facility.contains('bar')) return Icons.local_bar_rounded;
    if (facility.contains('ac') || facility.contains('air condition')) return Icons.ac_unit_rounded;
    if (facility.contains('tv')) return Icons.tv_rounded;
    return Icons.check_circle_outline_rounded;
  }
}
