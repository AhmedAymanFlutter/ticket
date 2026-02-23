import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_image_slider.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_main_info.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_details_section.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_bottom_actions.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // Using the standard TicketsAppBar with the requested subtitle
      appBar: const TicketsAppBar(
        subtitle: 'جاهز لرحلة جديدة؟... اختر وجهتك',
        showBack: true,
      ),
      bottomNavigationBar: const ActivityBottomActions(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // ── Image Slider Section (Section 1)
            const ActivityImageSlider(
              images: [
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800&auto=format&fit=crop',
              ],
            ),
            SizedBox(height: 24.h),

            // ── Main Info Section (Section 2)
            const ActivityMainInfo(),
            SizedBox(height: 24.h),

            // ── Activity Details Section (Section 3)
            const ActivityDetailsSection(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
