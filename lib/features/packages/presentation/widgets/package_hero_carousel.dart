import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_state.dart';
import 'package:ticket/features/packages/presentation/widgets/hero_card.dart';
import 'package:ticket/features/packages/presentation/widgets/buildInfoRow_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildActionButtons_widgets.dart';

class PackageHeroCarousel extends StatefulWidget {
  const PackageHeroCarousel({super.key});

  @override
  State<PackageHeroCarousel> createState() => _PackageHeroCarouselState();
}

class _PackageHeroCarouselState extends State<PackageHeroCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
      builder: (context, state) {
        if (state is! PackageDetailsSuccess &&
            state is! PackageDetailsLoading) {
          return const SizedBox.shrink();
        }

        final branches = state is PackageDetailsSuccess
            ? state.packageDetails.branches
            : List.generate(3, (index) => null);

        return Column(
          children: [
            SizedBox(
              height: 620.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                  if (state is PackageDetailsSuccess) {
                    context.read<PackageDetailsCubit>().selectBranch(page);
                  }
                },
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  final branch = branches[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildHeroCard(
                          name: branch?.name ?? '...',
                          location: branch != null && branch.cities.isNotEmpty
                              ? branch.cities.first.name ?? ''
                              : '...',
                          image:
                              branch?.imageCover ??
                              'https://images.unsplash.com/photo-1544918877-460635b6d13e',
                        ),
                        SizedBox(height: 8.h),
                        buildInfoRow(
                          nights: branch?.nightsCount ?? 0,
                          days: branch?.daysCount ?? 0,
                          price: branch?.totalBranchPrice.toDouble() ?? 0.0,
                        ),
                        SizedBox(height: 24.h),
                        buildActionButtons(),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                branches.length,
                (index) => _buildDot(index == _currentPage),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: active ? 24.w : 12.w,
      height: 12.h,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFFF5252) : const Color(0xFFFFECEC),
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
