import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket/core/utils/app_colors.dart';

class ActivityPackageCard extends StatelessWidget {
  final String title;
  final String price;

  const ActivityPackageCard({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Row
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/package.svg',
                  colorFilter: ColorFilter.mode(
                    const Color(0xFFFF5252),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Spacer(),
              // Title
              Expanded(
                flex: 8,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Madani Arabic',
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.info_outline,
                size: 20.sp,
                color: const Color(0xFF6B7280),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Features (Listed vertically, right-aligned)
          _buildPackageItem(Icons.bolt, 'تأكيد فوري', Colors.amber),
          SizedBox(height: 12.h),
          _buildPackageItem(
            Icons.phone_android,
            'عرض التذكرة عبر الهاتف المحمول أو طباعتها',
            const Color(0xFF374151),
          ),
          SizedBox(height: 12.h),
          _buildPackageItem(
            Icons.cancel_outlined,
            'إلغاء مجاني',
            const Color(0xFF374151),
          ),
          SizedBox(height: 24.h),

          // ── Price Action Row
          Row(
            children: [
              // Tax Text (Left in RTL)
              Text(
                '(شامل ضريبة القيمة المضافة)',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF6B7280),
                  fontFamily: 'Madani Arabic',
                ),
              ),
              const Spacer(),
              // Price Box (Right in RTL)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xFFD1D5DB)),
                ),
                child: Row(
                  children: [
                    Text(
                      '﷼',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageItem(IconData icon, String label, Color iconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(icon, size: 22.sp, color: iconColor),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF1A1A1A),
              fontFamily: 'Madani Arabic',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
