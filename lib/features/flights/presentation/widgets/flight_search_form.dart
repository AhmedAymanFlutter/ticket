import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FlightSearchForm extends StatefulWidget {
  const FlightSearchForm({super.key});

  @override
  State<FlightSearchForm> createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  bool isRoundTrip = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 480.h, // Adjusted height for layout
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.93), Colors.white],
          stops: const [0.0775, 1.0],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x17000000),
            blurRadius: 7.3,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          // Toggle Round Trip / One Way
          Container(
            height: 44.h,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(33.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildToggleItem(
                  title: 'flights.one_way',
                  isSelected: !isRoundTrip,
                  onTap: () => setState(() => isRoundTrip = false),
                  icon: Icons.arrow_forward_outlined,
                  isSelectedStyle: false,
                ),
                _buildToggleItem(
                  title: 'flights.round_trip',
                  isSelected: isRoundTrip,
                  onTap: () => setState(() => isRoundTrip = true),
                  icon: Icons.swap_horiz,
                  isSelectedStyle: true,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // From/To Fields
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildField(
                      label: 'flights.to',
                      hint: 'flights.arrival_station',
                      icon: Icons.flight_land,
                      svgPath: 'assets/icons/flight.svg',
                      width: 150.w,
                    ),
                  ),
                  SizedBox(width: 40.w), // Space for swap button
                  Expanded(
                    child: _buildField(
                      label: 'flights.from',
                      hint: 'flights.departure_station',
                      icon: Icons.flight_takeoff,
                      svgPath: 'assets/icons/flight.svg',
                      width: 150.w,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 12.h,
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEAE9EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.swap_horiz,
                    size: 16.sp,
                    color: const Color(0xFF282A51),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Date Selection
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'flights.return_date',
                  hint: 'mm-dd-yyyy',
                  icon: Icons.calendar_today_outlined,
                  width: 150.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildField(
                  label: 'flights.departure_date',
                  hint: 'mm-dd-yyyy',
                  icon: Icons.calendar_month_outlined,
                  width: 150.w,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Travelers and Email
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'flights.passengers',
                  hint: 'flights.passenger_count',
                  icon: Icons.group_outlined,
                  svgPath: 'assets/icons/user-group.svg',
                  width: 150.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildField(
                  label: 'auth.email',
                  hint: 'your@email.com',
                  icon: Icons.email_outlined,
                  width: 150.w,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Phone Number
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 160.w, // Half width
              child: _buildField(
                label: 'auth.phone',
                hint: '05xxxxxxxx',
                icon: Icons.phone_outlined,
                width: 150.w,
              ),
            ),
          ),

          const Spacer(),

          // Submit Button
          Container(
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'flights.send_request'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.near_me_outlined,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData icon,
    required bool isSelectedStyle,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33.r),
            color: isSelected
                ? (isSelectedStyle
                      ? const Color(0xFF282A51).withOpacity(0.12)
                      : Colors.white)
                : Colors.transparent,
            border: isSelected && isSelectedStyle
                ? Border.all(color: const Color(0xFF282A51).withOpacity(0.3))
                : null,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isSelectedStyle && isSelected)
                Icon(icon, size: 18.sp, color: const Color(0xFF282A51)),
              if (isSelectedStyle && isSelected)
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: const BoxDecoration(
                    color: Color(0xFF282A51),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 14.sp, color: Colors.white),
                ),
              if (!isSelected) Icon(icon, size: 18.sp, color: Colors.grey),
              SizedBox(width: 8.w),
              Text(
                title.tr(),
                style: TextStyle(
                  color: isSelected ? const Color(0xFF282A51) : Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String hint,
    required IconData icon,
    String? svgPath,
    double? width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              label.tr(),
              style: TextStyle(
                color: const Color(0xFF1D1B20),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Madani Arabic',
              ),
            ),
            SizedBox(width: 4.w),
            if (svgPath != null)
              SvgPicture.asset(
                svgPath,
                width: 14.w,
                height: 14.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1D1B20),
                  BlendMode.srcIn,
                ),
              )
            else
              Icon(icon, size: 14.sp, color: const Color(0xFF1D1B20)),
          ],
        ),
        SizedBox(height: 6.h),
        Container(
          width:
              width, // Use the provided width, or let Expanded handle it if null
          height: 36.h,
          padding: EdgeInsets.only(
            top: 6.h,
            right: 8.w,
            bottom: 6.h,
            left: 8.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFEAE9EB)),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            textDirection: ui.TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  hint.tr(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 11.sp, // Adjusted to fit height
                    fontFamily: 'Madani Arabic',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF9E9E9E),
                size: 18.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
