import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/auth/presentation/pages/signup_view.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:ticket/injection_container.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnboardingCubit>()..loadPages(),
      child: const OnboardingScaffold(),
    );
  }
}

class OnboardingScaffold extends StatefulWidget {
  const OnboardingScaffold({super.key});

  @override
  State<OnboardingScaffold> createState() => _OnboardingScaffoldState();
}

class _OnboardingScaffoldState extends State<OnboardingScaffold> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            FadeNavigation.pushFromBottom(context, const SignupView());
          }
        },
        builder: (context, state) {
          if (state is OnboardingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OnboardingLoaded) {
            return Stack(
              children: [
                // Background Image PageView
                Positioned.fill(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.pages.length,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().pageChanged(index);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        width: 375.w,
                        height: 812.h,
                        state.pages[index].imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: AppColors.splashBackground);
                        },
                      );
                    },
                  ),
                ),

                // // Gradient Overlay
                // Positioned.fill(
                //   child: IgnorePointer(
                //     child: Container(
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter,
                //           colors: [
                //             // Colors.transparent,
                //             Colors.black.withOpacity(0.1),
                //             Colors.black.withOpacity(
                //               0.2,
                //             ), // Subtle dark overlay
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // Header (Skip Button)
                Positioned(
                  top: 50.h,
                  left: 20
                      .w, // Adjust for RTL if needed automatically by Directionality
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      if (!state.isLastPage)
                        TextButton(
                          onPressed: () {
                            context
                                .read<OnboardingCubit>()
                                .completeOnboarding();
                          },
                          child: Text(
                            'onboarding.skip'.tr(),
                            style: AppTextStyle.bodyRegular.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Glassmorphism Card Container
                // Specs: width: 343; height: 245; top: 505px; left: 16px;
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 50.h,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        // height: 245.h, // Removed fixed height
                        width: 343.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 24.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                            0.4,
                          ), // Adjust opacity as needed
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            Text(
                              state.pages[state.pageIndex].title,
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                height: 1.6, // 160%
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12.h),

                            // Description
                            Text(
                              state.pages[state.pageIndex].description,
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.8, // 180%
                                color: Colors.white.withOpacity(0.8),
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 20.h),

                            // Dots Indicator
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                state.pages.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  width: state.pageIndex == index ? 24.w : 8.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.r),
                                    color: state.pageIndex == index
                                        ? AppColors.brandSecondary
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20.h),

                            // Action Button
                            Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                gradient: AppColors
                                    .secondary, // Assuming this is the orange gradient
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (state.isLastPage) {
                                    context
                                        .read<OnboardingCubit>()
                                        .completeOnboarding();
                                  } else {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  state.isLastPage
                                      ? 'onboarding.start'.tr()
                                      : 'onboarding.next'.tr(),
                                  style: AppTextStyle.button.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
