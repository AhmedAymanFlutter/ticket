import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/home/presentation/widgets/special_offer_card.dart';

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
    'common.programs',
    'common.hotels',
    'common.activities',
    'common.collected_packages',
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
                  setState(() {
                    _selectedIndex = index;
                  });
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
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              // Mock Data
              final titles = [
                'home.three_days_in_paris'.tr(),
                'home.week_in_maldives'.tr(),
                'home.tour_in_old_cairo'.tr(),
              ];
              final descriptions = [
                'home.paris_desc'.tr(),
                'home.maldives_desc'.tr(),
                'home.cairo_desc'.tr(),
              ];
              final prices = [4000, 12000, 1500];
              final types = [
                'common.programs'.tr(),
                'common.hotels'.tr(),
                'common.activities'.tr(),
              ];
              final images = [
                'assets/photo/image (1).png',
                'assets/photo/home_cobonant.png',
                'assets/photo/image (1).png',
              ];

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SpecialOfferCard(
                  imagePath: images[index % images.length],
                  title: titles[index % titles.length],
                  description: descriptions[index % descriptions.length],
                  days: 3 + index,
                  price: prices[index % prices.length],
                  type: types[index % types.length],
                ),
              );
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
