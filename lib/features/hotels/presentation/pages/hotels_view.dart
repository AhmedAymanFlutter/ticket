import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_card.dart';
import '../widgets/hotel_search_bar.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final images = [
      'assets/photo/image (1).png',
      'assets/photo/home_cobonant.png',
      'assets/photo/image (1).png',
      'assets/photo/home_cobonant.png',
    ];
    final titles = List.generate(8, (index) => 'hotels.hotel_name_sample'.tr());
    final locations = List.generate(8, (index) => 'hotels.city_sample'.tr());
    final distances = List.generate(
      8,
      (index) =>
          'hotels.distance_km'.tr(namedArgs: {'distance': '${75 + index}'}),
    );
    final prices = List.generate(8, (index) => 700 + (index * 50));
    final tags = List.generate(8, (index) => 'hotels.luxury_suite'.tr());
    final discounts = List.generate(8, (index) => index % 3 == 0 ? '20%' : '');

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: TicketsAppBar(title: 'hotels.title'.tr(), showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Section
            const HotelSearchBar(),

            SizedBox(height: 24.h),

            // Hotel List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 8,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
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
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
