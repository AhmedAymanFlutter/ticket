import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class HotelCategoriesFilters extends StatefulWidget {
  const HotelCategoriesFilters({super.key});

  @override
  State<HotelCategoriesFilters> createState() => _HotelCategoriesFiltersState();
}

class _HotelCategoriesFiltersState extends State<HotelCategoriesFilters> {
  int _selectedIndex = 0;

  final List<String> _categories = ['الجميع', 'غرف', 'ردهة', 'مطعم'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 76.w : 72.w,
              height: 43.h,
              decoration: BoxDecoration(
                gradient: isSelected ? AppColors.secondary : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(isSelected ? 8.r : 12.r),
                border: isSelected
                    ? null
                    : Border.all(color: const Color(0xFFE5E7EB), width: 1.6.w),
                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                        ),
                      ]
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF101828),
                  fontSize: 16.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
