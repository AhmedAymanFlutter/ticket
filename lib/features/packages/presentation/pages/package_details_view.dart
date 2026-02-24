import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/package_highlights/package_highlights_section.dart';
import 'package:ticket/features/packages/presentation/widgets/buildProgramSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildDestinationsSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildContactSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/package_hero_carousel.dart';

class PackageDetailsView extends StatelessWidget {
  const PackageDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const TicketsAppBarDetails(
        title: 'تفاصيل الباقة',
        showBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const PackageHeroCarousel(),
            SizedBox(height: 24.h),
            buildInclusionSection(),
            SizedBox(height: 24.h),
            buildDestinationsSection(),
            SizedBox(height: 24.h),
            buildProgramSection(),
            SizedBox(height: 24.h),
            buildContactSection(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
