import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/activities/presentation/pages/activity_details_view.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_hero_section.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_info_section.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_section_slider.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/models/place_item.dart';

/// The main orchestrator view for the Tour Guide Details page.
/// Follows Clean Architecture by delegating UI sections to specialized widgets.
class TourGuideDetailsView extends StatelessWidget {
  const TourGuideDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const TicketsAppBar(title: 'تفاصيل الوجهة', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Hero Section (Image + Title + Info Chips)
            const GuideHeroSection(),
            SizedBox(height: 16.h),

            // ── Main Info Section (Description + Detailed Info Cards)
            const GuideInfoSection(),
            SizedBox(height: 24.h),

            // ── Cities slider
            const GuideSectionSlider(
              title: 'أفضل المدن في المملكة المتحدة',
              subtitle:
                  'اكتشف أبرز المناطق السياحية في المملكة المتحدة وأكثر الأماكن زيارة.',
              places: sampleCities,
            ),
            SizedBox(height: 24.h),

            // ── Activities slider
            GuideSectionSlider(
              title: 'أفضل الأنشطة في المملكة المتحدة',
              subtitle:
                  'استمتع بتجارب متنوعة تشمل المعالم الشهيرة، والتسوق، والأنشطة الترفيهية الفريدة.',
              places: sampleActivities,
              onItemTap: () {
                FadeNavigation.pushFade(context, ActivityDetailsView());
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
