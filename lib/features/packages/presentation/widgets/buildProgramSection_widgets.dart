import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/packages/presentation/widgets/program/models/program_day.dart';
import 'package:ticket/features/packages/presentation/widgets/program/widgets/program_day_card.dart';
import 'package:ticket/features/packages/presentation/widgets/program/widgets/program_timeline.dart';

Widget buildProgramSection() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        // ── Section header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'برنامج الرحلة',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Text(
            'دليلك اليومي المعمار',
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF9CA3AF),
              fontFamily: 'Madani Arabic',
            ),
          ),
        ),
        SizedBox(height: 20.h),
        // ── Timeline + Day cards
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgramTimeline(count: sampleProgramDays.length),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  children: sampleProgramDays
                      .map((day) => ProgramDayCard(day: day))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );
}

// Backward-compatible
Widget buildProgramItem(String day, String description) => ProgramDayCard(
  day: ProgramDay(
    dayLabel: day,
    title: day,
    description: description,
    tags: const [],
  ),
);
