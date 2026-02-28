import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_card.dart';
import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';
import 'package:ticket/features/tours/presentation/manager/tours_state.dart';

class ActivitiesToursList extends StatelessWidget {
  const ActivitiesToursList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToursCubit, ToursState>(
      builder: (context, state) {
        if (state is ToursLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ActivityCard();
              },
            ),
          );
        } else if (state is ToursFailure) {
          return Center(child: Text(state.message));
        } else if (state is ToursSuccess) {
          final tours = state.tours;
          if (tours.isEmpty) {
            return const Center(child: Text('No activities available'));
          }
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  return ActivityCard(tour: tours[index]);
                },
              ),
              if (state.isFetchingMore)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
