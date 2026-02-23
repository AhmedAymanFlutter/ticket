import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class ActivityBookingBottomSheet extends StatefulWidget {
  const ActivityBookingBottomSheet({super.key});

  @override
  State<ActivityBookingBottomSheet> createState() =>
      _ActivityBookingBottomSheetState();
}

class _ActivityBookingBottomSheetState
    extends State<ActivityBookingBottomSheet> {
  int _selectedTab = 1; // Default to 'الشروط والأحكام' (Middle tab)

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12.h),
          // ── Grab Handle
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),

          // ── Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.grey, size: 24.sp),
                  ),
                ),
                Text(
                  'رحلة بحرية فاخرة على الساحل لشخصين',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Madani Arabic',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // ── Quick Info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android, color: Colors.grey, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                'عرض التذكرة عبر الهاتف المحمول أو طباعتها',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 20.w),
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
          SizedBox(height: 20.h),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          SizedBox(height: 16.h),

          // ── Tabs
          SingleChildScrollView(
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
          ),
          SizedBox(height: 24.h),

          // ── Tab Content
          _buildContent(),
          SizedBox(height: 32.h),

          // ── Book Now Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Container(
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
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(12.r),
                  child: Center(
                    child: Text(
                      'احجز الآن',
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
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final active = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFE5F0FF) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: active ? const Color(0xFF3B82F6) : const Color(0xFFD1D5DB),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: active ? const Color(0xFF3B82F6) : const Color(0xFF6B7280),
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            fontFamily: 'Madani Arabic',
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedTab == 1) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'سياسات الحجز',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'يجب على الضيوف الوصول قبل 30 دقيقة على الأقل من وقت الحجز المحدد.',
            ),
            SizedBox(height: 24.h),
            Text(
              'سياسة الإلغاء',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem('التذاكر غير قابلة للاسترداد.'),
          ],
        ),
      );
    } else if (_selectedTab == 2) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'تفاصيل',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'اتبع التعليمات للوصول إلى منطقة الصعود إلى الطائرة.',
            ),
            SizedBox(height: 12.h),
            _buildCheckmarkItem(
              'استخدم تذكرتك الإلكترونية لإتمام عملية تسجيل الوصول.',
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 100.h,
      child: const Center(child: Text('وصف الحزمة')),
    );
  }

  Widget _buildCheckmarkItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check, color: Colors.black, size: 20.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF1F2937),
              fontFamily: 'Madani Arabic',
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
