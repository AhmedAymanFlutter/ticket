import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelAmenities extends StatelessWidget {
  const HotelAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _buildHeader(),
        ),
        SizedBox(height: 16.h),
        _buildAmenitiesContainer(),
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

  Widget _buildAmenitiesContainer() {
    return Container(
      width: 343.w,
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAmenityCard(Icons.pool_rounded, 'حمام سباحة'),
              _buildAmenityCard(
                Icons.directions_car_filled_rounded,
                'موقف سيارات',
              ),
              _buildAmenityCard(Icons.wifi_rounded, 'شبكة واي فاي'),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAmenityCard(Icons.spa_rounded, 'منتجع صحي'),
              _buildAmenityCard(Icons.fitness_center_rounded, 'نادي رياضي'),
              _buildAmenityCard(Icons.restaurant_rounded, 'مطعم'),
            ],
          ),
        ],
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
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF1D2939),
            ),
          ),
        ],
      ),
    );
  }
}
