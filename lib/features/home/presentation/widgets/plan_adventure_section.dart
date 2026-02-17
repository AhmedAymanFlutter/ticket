import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanAdventureSection extends StatelessWidget {
  const PlanAdventureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'home.tourism_activities'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFFF6F59),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'home.plan_your_adventure'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'home.plan_adventure_desc'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1A1A1A),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Banner Card
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Container(
              width: double.infinity,
              height: 220.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/photo/toursim_combonant.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'home.make_trip_special'.tr(),
                          style: TextStyle(
                            fontFamily: 'Madani Arabic',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            'home.find_best_activities'.tr(),
                            style: TextStyle(
                              fontFamily: 'Madani Arabic',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        // Button
                        GestureDetector(
                          onTap: () {
                            // Navigate to activities
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFE8E8E8,
                                ), // Light gray button background
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'home.view_all_activities'.tr(),
                                    style: TextStyle(
                                      fontFamily: 'Madani Arabic',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(
                                        0xFF282A51,
                                      ), // Dark text color
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.sp,
                                    color: const Color(0xFF282A51),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
