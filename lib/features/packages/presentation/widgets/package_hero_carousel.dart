import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  final List<Map<String, String>> _packages = [
    {
      'name': 'باقة شهر العسل',
      'location': 'الإمارات العربية المتحدة',
      'image':
          'https://images.unsplash.com/photo-1544918877-460635b6d13e?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'باقة دبي المميزة',
      'location': 'دبي، الإمارات',
      'image':
          'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'باقة سفاري الصحراء',
      'location': 'أبو ظبي، الإمارات',
      'image':
          'https://images.unsplash.com/photo-1451337511061-39754044c688?q=80&w=1000&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 580.h, // Increased to fix the 6.9px overflow
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _packages.length,
            itemBuilder: (context, index) {
              final package = _packages[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        buildHeroCard(
                          name: package['name']!,
                          location: package['location']!,
                          image: package['image']!,
                        ),
                        SizedBox(height: 8.h),
                        buildInfoRow(),
                        SizedBox(height: 24.h),
                        buildActionButtons(),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _packages.length,
            (index) => _buildDot(index == _currentPage),
          ),
        ),
      ],
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
