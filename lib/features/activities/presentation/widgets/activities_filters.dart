import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesFilters extends StatelessWidget {
  final String? selectedCity;
  final int? selectedMinPrice;
  final int? selectedMaxPrice;
  final VoidCallback onCityTapped;
  final VoidCallback onPriceTapped;

  const ActivitiesFilters({
    super.key,
    this.selectedCity,
    this.selectedMinPrice,
    this.selectedMaxPrice,
    required this.onCityTapped,
    required this.onPriceTapped,
  });

  @override
  Widget build(BuildContext context) {
    String priceLabel = 'activities.filter_price'.tr();
    if (selectedMinPrice != null && selectedMaxPrice != null) {
      priceLabel = '$selectedMinPrice - $selectedMaxPrice';
    } else if (selectedMinPrice != null) {
      priceLabel = '> $selectedMinPrice';
    } else if (selectedMaxPrice != null) {
      priceLabel = '< $selectedMaxPrice';
    }

    final List<Map<String, dynamic>> filters = [
      {
        'label': selectedCity ?? 'activities.filter_date'.tr(),
        'icon': Icons.location_on_outlined,
        'onTap': onCityTapped,
        'isActive': selectedCity != null,
      },
      {
        'label': priceLabel,
        'icon': Icons.keyboard_arrow_down,
        'onTap': onPriceTapped,
        'isActive': selectedMinPrice != null || selectedMaxPrice != null,
      },
      {
        'label': 'activities.filter_persons'.tr(),
        'icon': Icons.keyboard_arrow_down,
        'onTap': () {},
        'isActive': false,
      },
      {
        'label': 'activities.duration'.tr(),
        'icon': Icons.keyboard_arrow_down,
        'onTap': () {},
        'isActive': false,
      },
    ];

    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isActive = filter['isActive'] as bool;
          return GestureDetector(
            onTap: filter['onTap'] as VoidCallback,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFE8E9FF) : Colors.white,
                borderRadius: BorderRadius.circular(41.r),
                border: Border.all(
                  color: isActive
                      ? const Color(0xFF282A51)
                      : const Color(0xFFD9D9D9),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    filter['icon'] as IconData,
                    size: 16.sp,
                    color: isActive
                        ? const Color(0xFF282A51)
                        : const Color(0xFF1A1A1A),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    filter['label'] as String,
                    style: TextStyle(
                      color: isActive
                          ? const Color(0xFF282A51)
                          : const Color(0xFF1A1A1A),
                      fontSize: 12.sp,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
