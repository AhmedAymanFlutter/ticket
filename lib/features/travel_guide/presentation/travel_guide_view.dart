import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_card.dart';

class TravelGuideView extends StatelessWidget {
  const TravelGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for 4 destinations
    final List<Map<String, String>> guides = [
      {
        'title': 'about.guide_london_title'.tr(),
        'description': 'about.guide_london_desc'.tr(),
        'tag1': 'about.guide_europe'.tr(),
        'tag2': 'about.guide_trending'.tr(),
        'image':
            'assets/photo/image (1).png', // Using existing high-quality image for demo
      },
      {
        'title': 'about.guide_paris_title'.tr(),
        'description': 'about.guide_paris_desc'.tr(),
        'tag1': 'about.guide_europe'.tr(),
        'tag2': 'about.guide_trending'.tr(),
        'image': 'assets/photo/image (1).png',
      },
      {
        'title': 'about.guide_dubai_title'.tr(),
        'description': 'about.guide_dubai_desc'.tr(),
        'tag1': 'Asia', // Example
        'tag2': 'about.guide_trending'.tr(),
        'image': 'assets/photo/image (1).png',
      },
      {
        'title': 'about.guide_istanbul_title'.tr(),
        'description': 'about.guide_istanbul_desc'.tr(),
        'tag1': 'Eurasia', // Example
        'tag2': 'about.guide_trending'.tr(),
        'image': 'assets/photo/image (1).png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Internal Header
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'about.guide_header_title'.tr(),
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'about.guide_header_subtitle'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF676768),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ],
              ),
            ),

            // List of Cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              itemCount: guides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: GuideCard(
                    title: guides[index]['title']!,
                    description: guides[index]['description']!,
                    tag1: guides[index]['tag1']!,
                    tag2: guides[index]['tag2']!,
                    imagePath: guides[index]['image']!,
                  ),
                );
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
