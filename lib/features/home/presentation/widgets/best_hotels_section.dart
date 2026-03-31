import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/hotels/presentation/pages/hotel_details_view.dart';
import 'package:ticket/features/hotels/presentation/pages/hotels_view.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_card.dart';

class BestHotelsSection extends StatelessWidget {
  const BestHotelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home.find_perfect_stay'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF161616),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FadeNavigation.pushFade(context, const HotelsView());
                },
                child: Text(
                  'common.view_all'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF0F0B30),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // Hotel List (Horizontal)
        SizedBox(
          height: 350.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: 4, // Mocking more items for horizontal scroll
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              // Mock Data
              final titles = [
                'home.st_regis_rome'.tr(),
                'home.st_regis_rome'.tr(),
                'home.st_regis_rome'.tr(),
                'home.st_regis_rome'.tr(),
              ];
              final locations = List.generate(4, (_) => 'home.singapore'.tr());
              final distances = List.generate(4, (_) => 'home.distance_to_airport'.tr());
              final prices = [700, 850, 600, 950];
              final images = [
                'assets/photo/image (1).png',
                'assets/photo/home_cobonant.png',
                'assets/photo/image (1).png',
                'assets/photo/home_cobonant.png',
              ];

              return HotelCard(
                imagePath: images[index % images.length],
                title: titles[index],
                location: locations[index],
                distance: distances[index],
                price: prices[index],
                tag: 'home.luxury_suite'.tr(),
                discount: index == 0 ? '20%' : '',
                onTap: () {
                  FadeNavigation.pushFade(context, const HotelDetailsView());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
