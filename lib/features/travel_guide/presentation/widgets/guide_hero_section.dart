import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Hero section at the top of the Tour Guide Details page.
/// Displays a full-width image with a gradient overlay, a large title,
/// and info chips (language, currency, continent) at the bottom.
class GuideHeroSection extends StatelessWidget {
  const GuideHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Background image
        Image.network(
          'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&auto=format&fit=crop',
          width: double.infinity,
          height: 220.h,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, progress) =>
              progress == null ? child : _placeholder(),
          errorBuilder: (_, __, ___) => _placeholder(),
        ),
        // ── Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x88000000),
                  Color(0xDD000000),
                ],
                stops: [0.3, 0.65, 1.0],
              ),
            ),
          ),
        ),
        // ── Bottom content: title + info chips
        Positioned(
          bottom: 14.h,
          right: 16.w,
          left: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'السياحة في لندن',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Madani Arabic',
                  shadows: const [Shadow(color: Colors.black38, blurRadius: 4)],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  _GuideHeroChip(icon: Icons.language, label: 'الإنجليزية'),
                  SizedBox(width: 8.w),
                  const _HeroChipDivider(),
                  SizedBox(width: 8.w),
                  _GuideHeroChip(
                    icon: Icons.attach_money,
                    label: 'الجنيه الإسترليني',
                  ),
                  SizedBox(width: 8.w),
                  const _HeroChipDivider(),
                  SizedBox(width: 8.w),
                  _GuideHeroChip(icon: Icons.public, label: 'أوروبا'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _placeholder() {
    return Container(
      height: 220.h,
      color: const Color(0xFFF3F4F6),
      child: const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
    );
  }
}

// ── Info chip inside hero ────────────────────────────────────────────────────
class _GuideHeroChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GuideHeroChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
            fontFamily: 'Madani Arabic',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4.w),
        Icon(icon, size: 15.sp, color: Colors.white70),
      ],
    );
  }
}

// ── Vertical divider between chips ──────────────────────────────────────────
class _HeroChipDivider extends StatelessWidget {
  const _HeroChipDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 14, color: Colors.white38);
  }
}
