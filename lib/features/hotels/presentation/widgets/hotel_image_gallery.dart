import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelImageGallery extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageSelected;

  const HotelImageGallery({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 1.0, // Ensures square items
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final path = images[index];
          final isActive = index == selectedIndex;
          return GestureDetector(
            onTap: () => onImageSelected(index),
            child: _buildImageItem(path, isActive),
          );
        },
      ),
    );
  }

  Widget _buildImageItem(String path, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: isActive
            ? Border.all(color: const Color(0xFFFE406F), width: 4.w)
            : Border.all(color: const Color(0xFFF2F4F7), width: 1.w),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: const Color(0xFFFE406F).withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isActive ? 8.r : 11.r),
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}
