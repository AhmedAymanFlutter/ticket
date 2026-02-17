import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/features/home/presentation/widgets/hotel_card.dart';

class BestHotelsSection extends StatelessWidget {
  const BestHotelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'home.find_perfect_stay'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF161616),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'home.find_perfect_stay_desc'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  fontSize: 14.sp,
                  color: const Color(0xFF1A1A1A),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Hotel List
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2, // Mocking 2 items as per screenshot
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            // Mock Data
            final titles = [
              'home.st_regis_rome'.tr(),
              'home.st_regis_rome'.tr(),
            ];
            final locations = ['home.singapore'.tr(), 'home.singapore'.tr()];
            final distances = [
              'home.distance_to_airport'.tr(),
              'home.distance_to_airport'.tr(),
            ];
            final prices = [700, 700];
            final tags = ['home.luxury_suite'.tr(), 'home.luxury_suite'.tr()];
            final discounts = ['20%', ''];
            final images = [
              'assets/photo/image (1).png',
              'assets/photo/home_cobonant.png',
            ]; // Placeholders

            return HotelCard(
              imagePath: images[index % images.length],
              title: titles[index],
              location: locations[index],
              distance: distances[index],
              price: prices[index],
              tag: tags[index],
              discount: discounts[index],
            );
          },
        ),

        SizedBox(height: 24.h),

        // View All Button
        GestureDetector(
          onTap: () {
            // TODO: Navigate to All Hotels
          },
          child: Text(
            'common.view_all'.tr(),
            style: TextStyle(
              fontFamily: 'Madani Arabic',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF0F0B30),
            ),
          ),
        ),
      ],
    );
  }
}
