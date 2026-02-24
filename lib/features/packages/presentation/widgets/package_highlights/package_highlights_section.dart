import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'inclusion_header.dart';
import 'inclusion_toggle_buttons.dart';
import 'inclusion_checklist_card.dart';
import 'inclusion_overview_card.dart';

class PackageHighlightsSection extends StatefulWidget {
  const PackageHighlightsSection({super.key});

  @override
  State<PackageHighlightsSection> createState() =>
      _PackageHighlightsSectionState();
}

class _PackageHighlightsSectionState extends State<PackageHighlightsSection> {
  bool _withAccommodation = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      constraints: BoxConstraints(minHeight: 839.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InclusionHeader(),
          SizedBox(height: 8.h),
          InclusionToggleButtons(
            withAccommodation: _withAccommodation,
            onChanged: (value) => setState(() => _withAccommodation = value),
          ),
          SizedBox(height: 8.h),
          InclusionChecklistCard(withAccommodation: _withAccommodation),
          SizedBox(height: 8.h),
          const InclusionOverviewCard(),
        ],
      ),
    );
  }
}

// Backward-compatible function wrapper
Widget buildInclusionSection() => const PackageHighlightsSection();
