import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalSkeletonList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final double separatorWidth;

  const HorizontalSkeletonList({
    super.key,
    this.itemCount = 3,
    required this.itemBuilder,
    this.separatorWidth = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) => SizedBox(width: separatorWidth.w),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
