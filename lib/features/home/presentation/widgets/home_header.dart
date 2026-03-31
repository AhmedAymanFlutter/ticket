import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/greeting_card.dart';
import 'package:ticket/features/home/presentation/widgets/language_selector.dart';
import 'package:ticket/features/home/presentation/widgets/home_search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1B2136),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        image: DecorationImage(
          image: const AssetImage('assets/photo/home combonant.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar: Greetings & Language
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: GreetingCard()),
                SizedBox(width: 8.w),
                const LanguageSelector(),
              ],
            ),
            SizedBox(height: 48.h),

            // Hero Title
            Text(
              'home.trips_designed'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Madani Arabic',
                height: 1.2,
              ),
            ),
            SizedBox(height: 16.h),

            // Description
            Text(
              'home.plan_trip_desc'.tr(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.sp,
                fontFamily: 'Madani Arabic',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            // Search Bar
            const Center(child: HomeSearchBar()),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
