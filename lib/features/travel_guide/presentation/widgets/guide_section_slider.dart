import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/models/place_item.dart';

class GuideSectionSlider extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<PlaceItem> places;
  final Function(int index)? onItemTap;

  const GuideSectionSlider({
    super.key,
    required this.title,
    required this.subtitle,
    required this.places,
    this.onItemTap,
  });

  @override
  State<GuideSectionSlider> createState() => _GuideSectionSliderState();
}

class _GuideSectionSliderState extends State<GuideSectionSlider> {
  final PageController _ctrl = PageController();
  int _current = 0;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    if (index < 0 || index >= widget.places.length) return;
    _ctrl.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 343.w,
        height: 391.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 16.h),
              // ── Header (inside container, red bar on right)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 4.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5252),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        SizedBox(width: 8.w),

                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              fontFamily: 'Madani Arabic',
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF6B7280),
                        fontFamily: 'Madani Arabic',
                        height: 1.6,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () => widget.onItemTap?.call(_current),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _ctrl,
                            itemCount: widget.places.length,
                            onPageChanged: (i) => setState(() => _current = i),
                            itemBuilder: (_, i) {
                              final place = widget.places[i];
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    place.imageUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (_, child, p) => p == null
                                        ? child
                                        : Container(
                                            color: const Color(0xFFF3F4F6),
                                          ),
                                    errorBuilder: (_, __, ___) => Container(
                                      color: const Color(0xFFF3F4F6),
                                    ),
                                  ),
                                  // Bottom overlay
                                  Positioned.fill(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Color(0xCC000000),
                                          ],
                                          stops: [0.5, 1.0],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Name + desc (with recent style adjustments)
                                  Positioned(
                                    bottom: 16.h,
                                    right: 16.w,
                                    left: 16.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              width: 16.w,
                                              height: 16.h,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                    Colors.white,
                                                    BlendMode.srcIn,
                                                  ),
                                            ),
                                            SizedBox(width: 4.w),
                                            Flexible(
                                              child: Text(
                                                place.name,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                  fontFamily: 'Madani Arabic',
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          place.desc,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Madani Arabic',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // ── Pagination row
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Next arrow (Left in Arabic context)
                    GestureDetector(
                      onTap: () => _goTo(_current - 1),
                      child: Icon(
                        Icons.chevron_left,
                        size: 24.sp,
                        color: _current > 0
                            ? AppColors.primary
                            : const Color(0xFFD1D5DB),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // Dots
                    Row(
                      children: List.generate(widget.places.length, (i) {
                        final active = i == _current;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: active ? 20.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: active
                                ? AppColors.primary
                                : const Color(0xFFD1D5DB),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: 12.w),
                    // Prev arrow (Right in Arabic context)
                    GestureDetector(
                      onTap: () => _goTo(_current + 1),
                      child: Icon(
                        Icons.chevron_right,
                        size: 24.sp,
                        color: _current < widget.places.length - 1
                            ? AppColors.primary
                            : const Color(0xFFD1D5DB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
