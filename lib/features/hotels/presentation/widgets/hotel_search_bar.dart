import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelSearchBar extends StatelessWidget {
  const HotelSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Destination and Guests
          Row(
            children: [
              Expanded(
                child: _buildSearchField(
                  label: 'hotels.destination'.tr(),
                  hint: 'hotels.destination_hint'.tr(),
                  icon: Icons.location_on_outlined,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildSearchField(
                  label: 'hotels.guests'.tr(),
                  hint: 'hotels.guests_hint'.tr(),
                  icon: Icons.people_outline,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Row 2: Arrival and Departure
          Row(
            children: [
              Expanded(
                child: _buildSearchField(
                  label: 'hotels.check_in'.tr(),
                  hint: 'hotels.check_in_hint'.tr(),
                  icon: Icons.calendar_today_outlined,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildSearchField(
                  label: 'hotels.check_out'.tr(),
                  hint: 'hotels.check_out_hint'.tr(),
                  icon: Icons.calendar_today_outlined,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Search Button
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: 140.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: const Color(0xFF282A50),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 20.sp),
                    SizedBox(width: 8.w),

                    Text(
                      'hotels.search_button'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      width: 160.w,
      height: 48.h,
      padding: EdgeInsets.only(right: 16.w, left: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 0.8),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8A8A8A), size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xFF8A8A8A),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
                Text(
                  hint,
                  style: TextStyle(
                    color: const Color(0xFF1A1A1A),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
