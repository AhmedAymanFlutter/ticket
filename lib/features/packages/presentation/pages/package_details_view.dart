import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/packages/presentation/widgets/buidInclution_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildActionButtons_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildDotsIndicator_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildInfoRow_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildProgramSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildDestinationsSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/hero_card.dart';

class PackageDetailsView extends StatelessWidget {
  const PackageDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const TicketsAppBar(title: 'تفاصيل الباقة', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildHeroCard(),
                  SizedBox(height: 8.h),
                  buildInfoRow(),
                  SizedBox(height: 24.h),
                  buildActionButtons(),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            buildDotsIndicator(),
            SizedBox(height: 24.h),
            buildInclusionSection(),
            SizedBox(height: 24.h),
            buildDestinationsSection(),
            SizedBox(height: 24.h),
            buildProgramSection(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
