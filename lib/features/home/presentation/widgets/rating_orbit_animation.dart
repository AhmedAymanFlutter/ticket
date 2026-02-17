import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Orbit Item Model
enum OrbitItemType { dot, card }

class OrbitItem {
  final double angle; // Starting angle in radians
  final OrbitItemType type;
  final Color? color;
  final Map<String, dynamic>? data;

  OrbitItem({required this.angle, required this.type, this.color, this.data});
}

class RatingOrbitAnimation extends StatefulWidget {
  final int currentIndex;
  final List<Map<String, dynamic>> reviews;

  const RatingOrbitAnimation({
    super.key,
    required this.currentIndex,
    required this.reviews,
  });

  @override
  State<RatingOrbitAnimation> createState() => _RatingOrbitAnimationState();
}

class _RatingOrbitAnimationState extends State<RatingOrbitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Configuration
  final double orbitRadius = 140.0;
  final Duration rotationDuration = const Duration(
    seconds: 20,
  ); // Slower for elegance

  late List<OrbitItem> _orbitItems;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: rotationDuration)
      ..repeat(); // Infinite loop
    _initOrbitItems();
  }

  @override
  void didUpdateWidget(RatingOrbitAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex ||
        oldWidget.reviews != widget.reviews) {
      _initOrbitItems();
    }
  }

  void _initOrbitItems() {
    _orbitItems = [
      // Dots (Static positions relative to orbit, rotating with animation)
      OrbitItem(
        angle: 0,
        type: OrbitItemType.dot,
        color: const Color(0xFF4CAF50),
      ),
      OrbitItem(
        angle: math.pi,
        type: OrbitItemType.dot,
        color: const Color(0xFFFFC107),
      ),
      OrbitItem(
        angle: math.pi / 2,
        type: OrbitItemType.dot,
        color: const Color(0xFFF44336),
      ),
    ];

    // Distribute reviews evenly on the orbit
    if (widget.reviews.isNotEmpty) {
      for (int i = 0; i < widget.reviews.length; i++) {
        // Place them at specific angles
        double angle =
            (i * (2 * math.pi / widget.reviews.length)) - (math.pi / 4);
        _orbitItems.add(
          OrbitItem(
            angle: angle,
            type: OrbitItemType.card,
            data: widget.reviews[i],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h, // Reduced height slightly
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // 1. Thin Circular Orbit Path
          Container(
            width: (orbitRadius * 2).w,
            height: (orbitRadius * 2).w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
            ),
          ),

          // 2. Center Image
          Container(
            width: 160.w, // Slightly smaller
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.asset(
                'assets/photo/rating_combonant.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 3. Rotating Items
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: _orbitItems.map((item) {
                  final double currentAngle =
                      item.angle + (_controller.value * 2 * math.pi);
                  final double x = orbitRadius.w * math.cos(currentAngle);
                  final double y = orbitRadius.w * math.sin(currentAngle);

                  return Transform.translate(
                    offset: Offset(x, y),
                    child: _buildOrbitItem(item),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrbitItem(OrbitItem item) {
    if (item.type == OrbitItemType.dot) {
      return Container(
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: item.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: item.color!.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: Colors.white, width: 2),
        ),
      );
    } else {
      // Highlight the card if it matches the current index
      // For now, simpler implementation: just show the card
      final bool isActive =
          widget.reviews.indexOf(item.data!) == widget.currentIndex;

      return AnimatedScale(
        scale: isActive ? 1.2 : 0.9,
        duration: const Duration(milliseconds: 300),
        child: _buildReviewCard(item.data!, isActive),
      );
    }
  }

  Widget _buildReviewCard(Map<String, dynamic> data, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
        border: isActive
            ? Border.all(color: const Color(0xFFFE406F), width: 1)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(data['avatar']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isActive) ...[
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${data['rating']}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: const Color(0xFFFFC107),
                      size: 10.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
