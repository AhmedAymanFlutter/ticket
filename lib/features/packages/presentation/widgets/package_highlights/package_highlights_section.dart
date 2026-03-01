import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'inclusion_header.dart';
import 'inclusion_toggle_buttons.dart';
import 'inclusion_checklist_card.dart';
import 'inclusion_overview_card.dart';

class PackageHighlightsSection extends StatefulWidget {
  final PackageBranchModel? branch;
  const PackageHighlightsSection({super.key, this.branch});

  @override
  State<PackageHighlightsSection> createState() =>
      _PackageHighlightsSectionState();
}

class _PackageHighlightsSectionState extends State<PackageHighlightsSection> {
  bool _withAccommodation = true;

  @override
  Widget build(BuildContext context) {
    // Collect all inclusions and exclusions from all tours in this branch
    final List<String> allInclusions = [];
    final List<String> allExclusions = [];

    if (widget.branch != null) {
      for (var day in widget.branch!.days) {
        if (day.type == 'TOUR' && day.tour != null) {
          allInclusions.addAll(day.tour!.inclusions);
          allExclusions.addAll(day.tour!.exclusions);
        }
      }
    }

    // Remove duplicates
    final uniqueInclusions = allInclusions.toSet().toList();
    final uniqueExclusions = allExclusions.toSet().toList();

    return Container(
      width: 343.w,
      constraints: BoxConstraints(minHeight: 400.h),
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
          InclusionChecklistCard(
            withAccommodation: _withAccommodation,
            inclusions: uniqueInclusions,
            exclusions: uniqueExclusions,
          ),
          SizedBox(height: 8.h),
          InclusionOverviewCard(title: widget.branch?.name ?? ''),
        ],
      ),
    );
  }
}

// Backward-compatible function wrapper
Widget buildInclusionSection(PackageBranchModel? branch) =>
    PackageHighlightsSection(branch: branch);
