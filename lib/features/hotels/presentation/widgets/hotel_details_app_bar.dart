import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelDetailsAppBar extends StatelessWidget {
  final HotelDetailsEntity? hotel;
  final bool isExpanded;
  final VoidCallback onBack;

  const HotelDetailsAppBar({
    super.key,
    required this.hotel,
    required this.isExpanded,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final images = hotel?.images ?? [];

    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.all(8.w),
        child: CircleAvatar(
          backgroundColor: Colors.white.withValues(alpha: 0.9),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1D2939)),
            onPressed: onBack,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.9),
            child:
                const Icon(Icons.favorite_border, color: Color(0xFF1D2939)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.9),
            child:
                const Icon(Icons.share_outlined, color: Color(0xFF1D2939)),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (images.isNotEmpty)
              Image.network(
                images[0],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildErrorPlaceholder(),
              )
            else if (hotel?.imageCover != null &&
                hotel!.imageCover.isNotEmpty)
              Image.network(
                hotel!.imageCover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildErrorPlaceholder(),
              )
            else
              _buildErrorPlaceholder(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: isExpanded
            ? Text(
                hotel?.name ?? 'تفاصيل الفندق',
                style: TextStyle(
                  color: const Color(0xFF1D2939),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Madani Arabic',
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: double.infinity,
      height: 300.h,
      color: Colors.grey[300],
      child: const Icon(Icons.image),
    );
  }
}
