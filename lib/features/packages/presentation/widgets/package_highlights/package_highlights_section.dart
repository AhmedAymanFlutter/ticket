import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'inclusion_header.dart';
import 'inclusion_toggle_buttons.dart';
import 'inclusion_checklist_card.dart';
import 'inclusion_overview_card.dart';

class PackageHighlightsSection extends StatefulWidget {
  final PackageDetailsModel? packageDetails;
  final int selectedBranchIndex;
  
  const PackageHighlightsSection({
    super.key, 
    this.packageDetails,
    this.selectedBranchIndex = 0,
  });

  @override
  State<PackageHighlightsSection> createState() =>
      _PackageHighlightsSectionState();
}

class _PackageHighlightsSectionState extends State<PackageHighlightsSection> {
  bool _withAccommodation = true;

  @override
  Widget build(BuildContext context) {
    final branch = widget.packageDetails != null && 
                   widget.packageDetails!.branches.isNotEmpty
        ? widget.packageDetails!.branches[widget.selectedBranchIndex]
        : null;

    // Collect all inclusions and exclusions from all tours in this branch
    final List<String> allInclusions = [];
    final List<String> allExclusions = [];

    if (branch != null) {
      for (var day in branch.days) {
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
          InclusionOverviewCard(
            title: widget.packageDetails?.pkg.name ?? '',
            description: widget.packageDetails?.pkg.description ?? '',
          ),
        ],
      ),
    );
  }
}

// Backward-compatible function wrapper
Widget buildInclusionSection(PackageDetailsModel? packageDetails) =>
    PackageHighlightsSection(packageDetails: packageDetails);
