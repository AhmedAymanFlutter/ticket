import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/features/flights/presentation/widgets/build_textField_widgets.dart';
import 'package:ticket/features/flights/presentation/widgets/build_toogelItem_widgets.dart';

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
                buildToggleItem(
                  title: 'flights.round_trip',
                  isSelected: isRoundTrip,
                  onTap: () => setState(() => isRoundTrip = true),
                  icon: SvgPicture.asset(
                    'assets/icons/roundTrip.svg',
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
                  isSelectedStyle: true,
                ),
                buildToggleItem(
                  title: 'flights.one_way',
                  isSelected: !isRoundTrip,
                  onTap: () => setState(() => isRoundTrip = false),
                  icon: SvgPicture.asset(
                    'assets/icons/oneWay.svg',
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
                  isSelectedStyle: false,
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
                    child: buildField(
                      label: 'flights.from',
                      hint: 'flights.departure_station',

                      svgPath: 'assets/icons/flight.svg',
                      width: 135.w,
                    ),
                  ),
                  SizedBox(width: 40.w), // Space for swap button
                  Expanded(
                    child: buildField(
                      label: 'flights.to',
                      hint: 'flights.arrival_station',

                      svgPath: 'assets/icons/flight.svg',
                      width: 135.w,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 3.h,
                child: Container(
                  width: 36.w,
                  height: 36.h,
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
                child: buildField(
                  label: 'flights.departure_date',
                  hint: 'mm-dd-yyyy',
                  svgPath: 'assets/photo/calendar-02.svg',
                  width: 135.w,
                  insideIcon: SvgPicture.asset('assets/photo/calendar-02.svg'),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: buildField(
                  label: 'flights.return_date',
                  hint: 'mm-dd-yyyy',
                  width: 135.w,
                  insideIcon: SvgPicture.asset('assets/photo/calendar-02.svg'),
                  svgPath: 'assets/photo/calendar-02.svg',
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Travelers and Email
          Row(
            children: [
              Expanded(
                child: buildField(
                  label: 'flights.passengers',
                  hint: 'flights.passenger_count',
                  svgPath: 'assets/icons/user-group.svg',
                  width: 135.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: buildField(
                  label: 'auth.email',
                  hint: 'your@email.com',
                  svgPath: 'assets/photo/mail-02.svg',
                  width: 135.w,
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
              child: buildField(
                label: 'auth.phone',
                hint: '05xxxxxxxx',
                width: 135.w,
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
}
