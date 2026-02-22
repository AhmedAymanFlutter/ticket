import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/more/presentation/widgets/quickActions/quick_actions_grid.dart';
import 'package:ticket/features/more/presentation/widgets/setting/settings_list.dart';
import 'package:ticket/features/more/presentation/widgets/setting/user_profile_header.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 120.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              // ─── User Profile Header ─────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const UserProfileHeader(),
              ),

              SizedBox(height: 24.h),

              // ─── Quick Actions Grid ──────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const QuickActionsGrid(),
              ),

              SizedBox(height: 24.h),

              // ─── Settings List ───────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const SettingsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
