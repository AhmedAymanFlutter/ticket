import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/rating_orbit_animation.dart';
import 'package:ticket/features/home/presentation/widgets/testimonial_card.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  int _currentIndex = 0;

  // Mock Reviews Data
  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'علي سالم',
      'avatar': 'assets/photo/image (1).png',
      'rating': 4.9,
      'comment':
          'تجربة رائعة جدًا! استمتعت بكل لحظة في الرحلة، التنظيم كان ممتازًا والفنادق كانت فاخرة ومريحة.',
    },
    {
      'name': 'سارة سعد',
      'avatar': 'assets/photo/home_cobonant.png',
      'rating': 4.8,
      'comment':
          'خدمة عملاء ممتازة وسرعة في الحجز. الأسعار كانت مناسبة جدًا مقارنة بالخدمات المقدمة. أنصح الجميع بالتعامل معهم.',
    },
    {
      'name': 'أحمد رفعت',
      'avatar': 'assets/photo/onboarding.jpeg',
      'rating': 5.0,
      'comment':
          'لقد كانت تجربة رائعة! كانت الرحلة منظمة بشكل مثالي، والفنادق رائعة، وتم الاهتمام بكل التفاصيل. لا أطيق الانتظار لمغامرتي القادمة!',
    },
    {
      'name': 'محمد رفعت',
      'avatar': 'assets/photo/ticket.png',
      'rating': 5.0,
      'comment':
          'لقد كانت تجربة رائعة! كانت الرحلة منظمة بشكل مثالي، والفنادق رائعة، وتم الاهتمام بكل التفاصيل. لا أطيق الانتظار لمغامرتي القادمة!',
    },
  ];

  void _nextReview() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _reviews.length;
    });
  }

  void _previousReview() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _reviews.length) % _reviews.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'آراء مسافرين', // Localization key: home.traveler_reviews
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF161616),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'تجارب سفر يشاركها عملاؤنا', // Localization key: home.traveler_reviews_desc
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF333333),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Orbital Animation
        RatingOrbitAnimation(currentIndex: _currentIndex, reviews: _reviews),

        SizedBox(height: 20.h),
        TestimonialCard(
          name: _reviews[_currentIndex]['name'],
          comment: _reviews[_currentIndex]['comment'],
          rating: _reviews[_currentIndex]['rating'],
          avatar: _reviews[_currentIndex]['avatar'],
          onNext: _nextReview,
          onPrevious: _previousReview,
        ),
      ],
    );
  }
}
