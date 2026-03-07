import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/flights/presentation/pages/flights_view.dart';
import 'package:ticket/features/hotels/presentation/pages/hotels_view.dart';
import 'package:ticket/features/more/presentation/services_view.dart';
import 'package:ticket/features/travel_guide/presentation/travel_guide_view.dart';
import 'package:ticket/features/home/presentation/widgets/GlassContainer_widgets.dart';

class HomeHeaderCategories extends StatelessWidget {
  const HomeHeaderCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'icon': 'assets/icons/hotel.png',
        'label': 'common.hotels'.tr(),
        'onTap': () => FadeNavigation.pushFade(context, const HotelsView()),
      },
      {
        'icon': 'assets/icons/maps.png',
        'label': 'nav.flights'.tr(),
        'onTap': () => FadeNavigation.pushFade(context, const FlightsView()),
      },
      {
        'icon': 'assets/icons/services.png',
        'label': 'more.services'.tr(),
        'onTap': () => FadeNavigation.pushFade(context, const ServicesView()),
      },
      {
        'icon': 'assets/icons/destination.png',
        'label': 'more.travel_guide'.tr(),
        'onTap': () =>
            FadeNavigation.pushFade(context, const TravelGuideView()),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          return Expanded(
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 3500 + (index * 300)),
              tween: Tween<double>(begin: 1.0, end: 0.0),
              curve: Curves.easeOutQuart,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 200.w, 0),
                  child: Opacity(
                    opacity: (1.0 - value).clamp(0.0, 1.0),
                    child: child,
                  ),
                );
              },
              child: GestureDetector(
                onTap: category['onTap'],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GlassContainer(
                      height: 64.r,
                      width: 64.r,
                      padding: EdgeInsets.zero,
                      radius: 32.r,
                      child: Center(
                        // isSvg: false,
                        child: Image.asset(
                          category['icon'],
                          width: 32.r,
                          height: 32.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      category['label'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Madani Arabic',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
