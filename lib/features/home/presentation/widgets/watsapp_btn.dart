import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatsappBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  final double? width;
  final double? height;

  const WatsappBtn({
    super.key,
    required this.child,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w,
        height: height?.h,
        padding: EdgeInsets.fromLTRB(10.w, 3.h, 10.w, 3.h),
        decoration: BoxDecoration(
          color: const Color(0xFF4AC759), // #4AC759
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}
