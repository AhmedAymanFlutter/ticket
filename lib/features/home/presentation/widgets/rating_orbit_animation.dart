import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'rating_orbit/orbit_center_piece.dart';
import 'rating_orbit/orbit_item_widget.dart';

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
      height: 350.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // 1. Elegant Circular Orbit Path
          Container(
            width: (orbitRadius * 2).w,
            height: (orbitRadius * 2).w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF0F0F0), width: 1.2),
            ),
          ),

          // 2. Center Image with Premium Frame
          const OrbitCenterPiece(),

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

                  final bool isActive =
                      item.type == OrbitItemType.card &&
                      widget.reviews.indexOf(item.data!) == widget.currentIndex;

                  return Transform.translate(
                    offset: Offset(x, y),
                    child: OrbitItemWidget(item: item, isActive: isActive),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
