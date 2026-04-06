import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';
import 'booking_card_components/booking_header.dart';
import 'booking_card_components/booking_date_field.dart';
import 'booking_card_components/booking_selector_field.dart';
import 'booking_card_components/booking_pricing_breakdown.dart';
import 'booking_card_components/booking_benefits.dart';

class HotelBookingCard extends StatelessWidget {
  final HotelDetailsEntity? hotel;
  const HotelBookingCard({super.key, this.hotel});

  @override
  Widget build(BuildContext context) {
    const List<String> benefits = [
      'إلغاء مجاني حتى 48 ساعة قبل الموعد',
      'لا حاجة للدفع اليوم',
      'تأكيد فوري',
    ];

    final price = hotel?.price.toString() ?? '0';

    return Container(
      width: 339.8.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          BookingHeader(price: price, subtitle: 'أفضل خيار متاح'),
          Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BookingDateField(
                  label: 'الوصول في',
                  iconPath: 'assets/photo/calendar-02.svg',
                ),
                SizedBox(height: 16.h),
                const BookingDateField(
                  label: 'المغادرة في',
                  iconPath: 'assets/photo/calendar-02.svg',
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    const Expanded(
                      child: BookingSelectorField(label: 'غرف', text: '1'),
                    ),
                    SizedBox(width: 12.w),
                    const Expanded(
                      child: BookingSelectorField(
                        label: 'الضيوف',
                        iconPath: 'assets/icons/user-group.svg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Divider(color: const Color(0xFFF3F4F6), thickness: 2.h),
                SizedBox(height: 16.h),
                BookingPricingBreakdown(
                  pricingItems: [
                    {'label': 'سعر الليلة', 'value': price},
                  ],
                  totalAmount: price,
                  totalSubtitle: 'السعر الإجمالي',
                ),
                SizedBox(height: 24.h),
                Divider(color: const Color(0xFFF3F4F6), thickness: 2.h),
                SizedBox(height: 24.h),
                // Booking Button
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: AppColors.secondary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      'احجز الان',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                const BookingBenefits(benefits: benefits),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
