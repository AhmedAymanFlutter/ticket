import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPricingBreakdown extends StatelessWidget {
  final List<Map<String, String>> pricingItems;
  final String totalAmount;
  final String totalSubtitle;

  const BookingPricingBreakdown({
    super.key,
    required this.pricingItems,
    required this.totalAmount,
    required this.totalSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...pricingItems.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _buildPricingRow(item['label']!, item['value']!),
          ),
        ),
        SizedBox(height: 12.h),
        Divider(color: const Color(0xFFF3F4F6), thickness: 2.h),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'المجموع',
              style: TextStyle(
                color: const Color(0xFF101828),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Madani Arabic',
              ),
            ),
            Row(
              children: [
                Text(
                  totalAmount,
                  style: TextStyle(
                    color: const Color(0xFFFE406F),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '﷼',
                  style: TextStyle(
                    color: const Color(0xFFFE406F),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            totalSubtitle,
            style: TextStyle(
              color: const Color(0xFF1A1A1A),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPricingRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1A1A1A),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: const Color(0xFF101828),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '﷼',
              style: TextStyle(
                color: const Color(0xFF101828),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
