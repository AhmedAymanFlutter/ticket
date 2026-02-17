import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/best_destination_card.dart';

class BestDestinationsSection extends StatelessWidget {
  const BestDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> destinations = [
      {
        'image': 'assets/photo/image (1).png', // Placeholder
        'title': 'cities.tokyo'.tr(),
        'description': 'cities.tokyo_desc'.tr(),
        'days': 5,
        'price': 2500,
      },
      {
        'image': 'assets/photo/image (1).png', // Placeholder
        'title': 'cities.barcelona'.tr(),
        'description': 'cities.barcelona_desc'.tr(),
        'days': 5,
        'price': 2500,
      },
      {
        'image': 'assets/photo/image (1).png', // Placeholder
        'title': 'cities.tokyo'.tr(),
        'description': 'cities.tokyo_desc'.tr(),
        'days': 7,
        'price': 3500,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),

        // Header
        Text(
          'home.best_destinations'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF161616),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'home.discover_world_gems'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 14.sp,
            color: const Color(0xFF1A1A1A),
          ),
        ),

        SizedBox(height: 24.h),

        // List
        SizedBox(
          height: 399.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final item = destinations[index];
              return BestDestinationCard(
                imagePath: item['image'],
                title: item['title'],
                description: item['description'],
                days: item['days'],
                price: item['price'],
              );
            },
          ),
        ),

        SizedBox(height: 40.h),
      ],
    );
  }
}
