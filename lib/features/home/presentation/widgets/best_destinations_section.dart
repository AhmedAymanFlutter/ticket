import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/best_destination_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/home/presentation/manager/cities_state.dart';
import 'package:ticket/core/widgets/horizontal_skeleton_list.dart';

class BestDestinationsSection extends StatelessWidget {
  const BestDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),

        // Header
        Text(
          'home.best_destinations'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF161616),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'home.discover_world_gems'.tr(),
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 14.sp,
            color: const Color(0xFF1A1A1A),
          ),
        ),

        SizedBox(height: 24.h),

        // List
        SizedBox(
          height: 399.h,
          child: BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) {
              if (state is CitiesLoading) {
                return HorizontalSkeletonList(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const BestDestinationCard(
                      imagePath: 'assets/photo/image (1).png',
                      title: 'Placeholder Title Here',
                      description:
                          'Placeholder description that takes up some space to show.',
                      days: 5,
                      price: 2500,
                    );
                  },
                );
              } else if (state is CitiesFailure) {
                return Center(child: Text(state.message));
              } else if (state is CitiesSuccess) {
                final cities = state.cities;
                if (cities.isEmpty) {
                  return const Center(child: Text('No cities available'));
                }
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return BestDestinationCard(
                      imagePath:
                          (city.imageCover != null &&
                              city.imageCover!.isNotEmpty)
                          ? city.imageCover!
                          : 'assets/photo/image (1).png',
                      title: city.name,
                      description: city.description,
                      days: 5, // Static for now as it's not from /cities API
                      price: 2500, // Static for now
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),

        SizedBox(height: 40.h),
      ],
    );
  }
}
