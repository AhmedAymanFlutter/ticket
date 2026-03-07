import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet/widgets/booking_action_button.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet/widgets/booking_header.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet/widgets/booking_quick_info.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet/widgets/booking_tab_content.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_booking_bottom_sheet/widgets/booking_tabs.dart';

class ActivityBookingBottomSheet extends StatefulWidget {
  const ActivityBookingBottomSheet({super.key});

  @override
  State<ActivityBookingBottomSheet> createState() =>
      _ActivityBookingBottomSheetState();
}

class _ActivityBookingBottomSheetState
    extends State<ActivityBookingBottomSheet> {
  int _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BookingHeader(title: 'رحلة بحرية فاخرة على الساحل لشخصين'),
          SizedBox(height: 16.h),
          const BookingQuickInfo(),
          SizedBox(height: 16.h),
          BookingTabs(
            selectedTab: _selectedTab,
            onTabSelected: (index) => setState(() => _selectedTab = index),
          ),
          SizedBox(height: 24.h),
          BookingTabContent(selectedTab: _selectedTab),
          SizedBox(height: 32.h),
          BookingActionButton(
            text: 'احجز الآن',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
