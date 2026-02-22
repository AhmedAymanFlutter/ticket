import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import '../widgets/flight_search_form.dart';
import '../widgets/flight_feature_card.dart';

class FlightsView extends StatelessWidget {
  const FlightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Background
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 380.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/photo/image (1).png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 380.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282A50).withOpacity(0.4),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'home.your_adventure'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'flights.where_to_next'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Text(
                        'flights.enter_city_desc'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12.sp,
                          fontFamily: 'Madani Arabic',
                        ),
                      ),
                    ),
                  ],
                ),
                // Search Form Overlapping
                Positioned(
                  top: 300.h,
                  left: 16.w,
                  right: 16.w,
                  child: const FlightSearchForm(),
                ),
              ],
            ),

            // Spacer for overlapping form
            SizedBox(height: 420.h),

            // "What we offer" section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text(
                    'flights.trusted_trips'.tr(),
                    style: TextStyle(
                      color: const Color(0xFFFE406F),
                      fontSize: 14.sp,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'flights.what_we_offer'.tr(),
                    style: TextStyle(
                      color: const Color(0xFF282A51),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const FlightFeatureCard(
                    icon: 'assets/icons/instant.svg', // Placeholder icon
                    title: 'flights.instant_booking',
                    desc: 'flights.instant_booking_desc',
                  ),
                  SizedBox(height: 16.h),
                  const FlightFeatureCard(
                    icon: 'assets/icons/secure.svg', // Placeholder icon
                    title: 'flights.secure_payments',
                    desc: 'flights.secure_payments_desc',
                  ),
                  SizedBox(height: 16.h),
                  const FlightFeatureCard(
                    icon: 'assets/icons/best_price.svg', // Placeholder icon
                    title: 'flights.best_prices',
                    desc: 'flights.best_prices_desc',
                  ),
                ],
              ),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
