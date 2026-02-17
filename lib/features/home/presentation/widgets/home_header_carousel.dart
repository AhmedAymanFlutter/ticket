import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/destination_card.dart';

class HomeHeaderCarousel extends StatelessWidget {
  final PageController pageController;

  const HomeHeaderCarousel({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> destinations = [
      {
        'image':
            'assets/photo/image (1).png', // Using existing assets as placeholders
        'title': 'cities.london'.tr(),
      },
      {
        'image': 'assets/photo/onboarding.jpeg',
        'title': 'cities.thailand'.tr(),
      },
      {'image': 'assets/photo/image (1).png', 'title': 'cities.london'.tr()},
      {
        'image': 'assets/photo/onboarding1.png',
        'title': 'cities.thailand'.tr(),
      },
    ];

    return SizedBox(
      height: 198.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: destinations.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final item = destinations[index];
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1.0;
              if (pageController.position.haveDimensions) {
                value = pageController.page! - index;
                value = (1 - (value.abs() * 0.1)).clamp(
                  0.0,
                  1.0,
                ); // Subtle scaling (0.9 at sides)
              }
              return Center(
                child: Transform.scale(
                  scale: Curves.easeOut.transform(value),
                  child: DestinationCard(
                    imagePath: item['image']!,
                    title: item['title']!,
                  ),
                ),
              );
            },
            child: DestinationCard(
              imagePath: item['image']!,
              title: item['title']!,
            ),
          );
        },
      ),
    );
  }
}
