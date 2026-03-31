import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/widgets/plan_trip_card.dart';
import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';
import 'package:ticket/features/tours/presentation/manager/tours_state.dart';
import 'package:ticket/core/widgets/horizontal_skeleton_list.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/activities/presentation/pages/activities_view.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_cubit.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_state.dart';
import 'package:ticket/core/helper/contact_helper.dart';

class PlanYourTripSection extends StatelessWidget {
  const PlanYourTripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home.plan_your_adventure'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF161616),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FadeNavigation.pushFade(
                    context,
                    MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: context.read<ToursCubit>()),
                        BlocProvider.value(value: context.read<CitiesCubit>()),
                      ],
                      child: const ActivitiesView(),
                    ),
                  );
                },
                child: Text(
                  'common.view_all'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B6E82),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // List
        SizedBox(
          height: 350.h, // Card height (338.h) + shadow space
          child: BlocBuilder<ContactUsCubit, ContactUsState>(
            builder: (context, contactState) {
              String? whatsappNumber;
              if (contactState is ContactUsSuccess) {
                whatsappNumber = ContactHelper.extractPhoneNumber(
                  contactState.settings.socialMedia.whatsApp.url,
                );
              }

              return BlocBuilder<ToursCubit, ToursState>(
                builder: (context, state) {
                  if (state is ToursLoading) {
                    return HorizontalSkeletonList(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 24.w),
                          child: Container(
                            width: 293.w,
                            height: 338.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ToursFailure) {
                    return CustomErrorWidget(
                      message: state.message,
                      onRetry: () => context.read<ToursCubit>().getTours(
                        context.locale.languageCode,
                      ),
                    );
                  } else if (state is ToursSuccess) {
                    final tours = state.tours;
                    if (tours.isEmpty) {
                      return const Center(child: Text('No tours available'));
                    }

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: tours.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.w),
                      itemBuilder: (context, index) {
                        final tour = tours[index];
                        return PlanTripCard(
                          imagePath: (tour.coverImage != null &&
                                  tour.coverImage!.isNotEmpty)
                              ? tour.coverImage!
                              : 'https://images.unsplash.com/photo-1544551763-46a013bb70d5',
                          title: tour.title ?? '',
                          description: tour.description ?? '',
                          duration: '4 hours',
                          price: tour.priceAmount?.toInt() ?? 0,
                          whatsappNumber: whatsappNumber,
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
