import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/activities/presentation/widgets/activities_filters.dart';
import 'package:ticket/features/activities/presentation/widgets/activities_search_bar.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_card.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            const ActivitiesSearchBar(),
            // Title Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'activities.explore_title'.tr(),
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'activities.offers_count'.tr(namedArgs: {'count': '76'}),
                    style: TextStyle(
                      color: const Color(0xFF8A8A8A),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Filters
            const ActivitiesFilters(),
            SizedBox(height: 24.h),

            // Activity Cards List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ActivityCard();
              },
            ),
            SizedBox(height: 100.h), // Bottom nav bar spacing
          ],
        ),
      ),
    );
  }
}
