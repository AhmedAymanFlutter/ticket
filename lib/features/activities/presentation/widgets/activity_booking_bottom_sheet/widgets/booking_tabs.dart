import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTabs extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const BookingTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildTab('وصف الحزمة', 0),
            SizedBox(width: 8.w),
            _buildTab('الشروط والأحكام', 1),
            SizedBox(width: 8.w),
            _buildTab('كيفية الاستخدام', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final active = selectedTab == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF282A5126) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: active ? const Color(0xFF6F708A) : const Color(0xFFD1D5DB),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: active ? const Color(0xFF282A51) : const Color(0xFF6B7280),
            fontWeight: active ? FontWeight.w400 : FontWeight.w400,
            fontFamily: 'Madani Arabic',
          ),
        ),
      ),
    );
  }
}
