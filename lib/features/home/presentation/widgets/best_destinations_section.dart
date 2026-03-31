import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/simple_destination_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/manager/branches_cubit.dart';
import 'package:ticket/features/home/presentation/manager/branches_state.dart';
import 'package:ticket/core/widgets/horizontal_skeleton_list.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';

class BestDestinationsSection extends StatelessWidget {
  const BestDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home.best_destinations'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF161616),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to all destinations
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
          height: 110.h,
          child: BlocBuilder<BranchesCubit, BranchesState>(
            builder: (context, state) {
              if (state is BranchesLoading) {
                return HorizontalSkeletonList(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Container(
                        width: 144.w,
                        height: 95.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is BranchesFailure) {
                return CustomErrorWidget(
                  message: state.message,
                  onRetry: () {
                    context.read<BranchesCubit>().getBranches(
                          context.locale.languageCode,
                        );
                  },
                );
              } else if (state is BranchesSuccess) {
                final branches = state.branches;
                if (branches.isEmpty) {
                  return const Center(
                    child: Text('No destinations available'),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: branches.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final branch = branches[index];
                    return SimpleDestinationCard(
                      imagePath: (branch.imageCover != null &&
                              branch.imageCover!.isNotEmpty)
                          ? branch.imageCover!
                          : 'https://images.unsplash.com/photo-1544551763-46a013bb70d5',
                      title: branch.name,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
