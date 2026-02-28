import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/tours/presentation/manager/tour_details_cubit.dart';
import 'package:ticket/features/tours/presentation/manager/tour_details_state.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_image_slider.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_main_info.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_details_section.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_bottom_actions.dart';
import 'package:ticket/injection_container.dart';

class ActivityDetailsView extends StatelessWidget {
  final String productCode;
  const ActivityDetailsView({super.key, required this.productCode});

  @override
  Widget build(BuildContext context) {
    final String lang = context.locale.languageCode;
    return BlocProvider(
      create: (context) =>
          sl<TourDetailsCubit>()..fetchTourDetails(lang, productCode),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: const TicketsAppBar(
          subtitle: 'جاهز لرحلة جديدة؟... اختر وجهتك',
          showBack: true,
        ),
        bottomNavigationBar: BlocBuilder<TourDetailsCubit, TourDetailsState>(
          builder: (context, state) {
            final tour = (state is TourDetailsSuccess)
                ? state.tourDetails
                : null;
            return ActivityBottomActions(tour: tour);
          },
        ),
        body: BlocBuilder<TourDetailsCubit, TourDetailsState>(
          builder: (context, state) {
            final bool isLoading = state is TourDetailsLoading;
            final tour = (state is TourDetailsSuccess)
                ? state.tourDetails
                : null;

            if (state is TourDetailsFailure) {
              return Center(child: Text(state.message));
            }

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    // Image Slider
                    ActivityImageSlider(
                      images:
                          tour?.images ??
                          [
                            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800&auto=format&fit=crop',
                          ],
                    ),
                    SizedBox(height: 24.h),

                    // Main Info
                    ActivityMainInfo(tour: tour),
                    SizedBox(height: 24.h),

                    // Details Section
                    ActivityDetailsSection(tour: tour),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
