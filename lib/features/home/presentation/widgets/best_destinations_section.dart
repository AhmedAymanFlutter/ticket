import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/best_destination_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/manager/branches_cubit.dart';
import 'package:ticket/features/home/presentation/manager/branches_state.dart';
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
          child: BlocBuilder<BranchesCubit, BranchesState>(
            builder: (context, state) {
              if (state is BranchesLoading) {
                return HorizontalSkeletonList(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const BestDestinationCard(
                      imagePath: 'assets/photo/image (1).png',
                      title: '...',
                      description: '...',
                      days: 5,
                      price: 0,
                    );
                  },
                );
              } else if (state is BranchesFailure) {
                return Center(child: Text(state.message));
              } else if (state is BranchesSuccess) {
                final branches = state.branches;
                if (branches.isEmpty) {
                  return const Center(child: Text('No destinations available'));
                }
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: branches.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    final branch = branches[index];
                    return BestDestinationCard(
                      imagePath:
                          (branch.imageCover != null &&
                              branch.imageCover!.isNotEmpty)
                          ? branch.imageCover!
                          : 'https://images.unsplash.com/photo-1544551763-46a013bb70d5',
                      title: branch.name,
                      description: branch.alt ?? '',
                      days: branch.daysCount,
                      price: branch.price,
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
