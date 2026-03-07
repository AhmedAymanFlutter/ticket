import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/packages/presentation/widgets/category_package_card/category_package_card_content.dart';
import 'package:ticket/features/packages/presentation/widgets/category_package_card/category_package_card_image.dart';

class CategoryPackageCard extends StatelessWidget {
  final String imageUrl;
  final String categoryBadge;
  final String countryName;
  final String locationText;
  final List<String> cities;
  final String buttonText;
  final VoidCallback onPhoneTap;
  final VoidCallback onWhatsAppTap;
  final VoidCallback onDetailsTap;

  const CategoryPackageCard({
    super.key,
    required this.imageUrl,
    required this.categoryBadge,
    required this.countryName,
    required this.locationText,
    required this.cities,
    required this.buttonText,
    required this.onPhoneTap,
    required this.onWhatsAppTap,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryPackageCardImage(
            imageUrl: imageUrl,
            categoryBadge: categoryBadge,
            countryName: countryName,
          ),
          CategoryPackageCardContent(
            cities: cities,
            buttonText: buttonText,
            onPhoneTap: onPhoneTap,
            onWhatsAppTap: onWhatsAppTap,
            onDetailsTap: onDetailsTap,
          ),
        ],
      ),
    );
  }
}
