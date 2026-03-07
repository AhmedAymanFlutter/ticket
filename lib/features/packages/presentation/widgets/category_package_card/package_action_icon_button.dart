import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageActionIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final Color color;

  const PackageActionIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
