import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelContactSection extends StatelessWidget {
  final HotelContactEntity? contact;
  final String address;
  final double? latitude;
  final double? longitude;

  const HotelContactSection({
    super.key,
    this.contact,
    required this.address,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    if (contact == null && address.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFE406F),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'معلومات الاتصال',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF1D2939),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
            ),
            child: Column(
              children: [
                _buildContactItem(Icons.location_on_rounded, 'العنوان', address),
                if (contact?.phone != null && contact!.phone!.isNotEmpty)
                  _buildContactItem(Icons.phone_rounded, 'الهاتف', contact!.phone!),
                if (contact?.email != null && contact!.email!.isNotEmpty)
                  _buildContactItem(Icons.email_rounded, 'البريد الإلكتروني', contact!.email!),
                if (latitude != null && longitude != null) ...[
                  SizedBox(height: 16.h),
                  _buildMapButton(),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapButton() {
    return InkWell(
      onTap: () {
        // Logic to open map would go here
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFE406F).withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFFE406F).withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, color: const Color(0xFFFE406F), size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'عرض الموقع على الخريطة',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Madani Arabic',
                color: const Color(0xFFFE406F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF667085), size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF667085),
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF1D2939),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
