import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/home/presentation/widgets/special_offer_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/manager/offers_cubit.dart';
import 'package:ticket/features/home/presentation/manager/offers_state.dart';
import 'package:ticket/core/widgets/horizontal_skeleton_list.dart';

class SpecialOffersSection extends StatefulWidget {
  const SpecialOffersSection({super.key});

  @override
  State<SpecialOffersSection> createState() => _SpecialOffersSectionState();
}

class _SpecialOffersSectionState extends State<SpecialOffersSection> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<String> _filters = [
    'common.all',
    'common.flight',
    'common.hotel',
    'common.package',
    'common.activity',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'home.special_offers'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF161616),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'home.special_offers_desc'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF333333),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Filter Tabs
        SizedBox(
          height: 35.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });

                    // Fetch offers for the newly selected filter
                    context.read<OffersCubit>().getOffers(
                      context.locale.languageCode,
                      filterCategory: _filters[index],
                    );
                  }
                },
                child: Container(
                  height: 29.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                    color: isSelected ? null : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _filters[index].tr(),
                    style: TextStyle(
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                      fontSize: 14.sp,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF161616),
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 24.h),

        // Cards PageView
        SizedBox(
          height: 215.h, // Adjusted for horizontal card height + margin
          child: BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              if (state is OffersLoading) {
                return HorizontalSkeletonList(
                  itemCount: 3,
                  separatorWidth: 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: const SpecialOfferCard(
                        imagePath: 'assets/photo/image (1).png',
                        title: 'Loading Offer...',
                        description: 'Loading description...',
                        days: 3,
                        price: 1000,
                        type: 'Loading',
                      ),
                    );
                  },
                );
              } else if (state is OffersFailure) {
                return CustomErrorWidget(
                  message: state.message,
                  onRetry: () => context.read<OffersCubit>().getOffers(
                    context.locale.languageCode,
                    filterCategory: state.activeFilter,
                  ),
                );
              } else if (state is OffersSuccess) {
                final offers = state.offers;
                if (offers.isEmpty) {
                  return Center(child: Text('home.no_offers'.tr()));
                }

                return PageView.builder(
                  controller: _pageController,
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SpecialOfferCard(
                        imagePath:
                            (offer.imageCover != null &&
                                offer.imageCover!.isNotEmpty)
                            ? offer.imageCover!
                            : 'assets/photo/image (1).png',
                        title: offer.title ?? '',
                        description: offer.description ?? '',
                        days:
                            int.tryParse(
                              offer.details?['totalDays']?.toString() ?? '',
                            ) ??
                            int.tryParse(
                              offer.details?['duration']?.toString() ?? '',
                            ) ??
                            1, // Fallback days logic
                        price: offer.price ?? 0,
                        type: offer.type ?? 'Offer',
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),

        SizedBox(height: 16.h),

        // Navigation Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Right Button (>) - Previous in RTL context (Visually on Right)
            GestureDetector(
              onTap: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkGray.withValues(alpha: 0.5),
                  ),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12.sp,
                    color: const Color(0xFF8E8E93).withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // Left Button (<) - Next in RTL context (Visually on Left)
            GestureDetector(
              onTap: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkGray.withValues(alpha: 0.5),
                  ),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12.sp,
                    color: const Color(0xFF8F8F8F).withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
