import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/flights/presentation/manager/flight_search_cubit.dart';
import 'package:ticket/features/flights/presentation/manager/flight_search_state.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:intl/intl.dart';

class FlightResultsView extends StatelessWidget {
  const FlightResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      builder: (context, state) {
        final response = state.searchResponse;
        final itineraries = response?.itineraries ?? [];

        return Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          appBar: const TicketsAppBar(subtitle: 'نتائج البحث'),
          body: Column(
            children: [
              // Search Summary Bar
              _buildSearchSummary(context, state),
              
              Expanded(
                child: itineraries.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: EdgeInsets.all(16.w),
                        itemCount: itineraries.length,
                        itemBuilder: (context, index) {
                          final itinerary = itineraries[index];
                          return _buildFlightCard(itinerary);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchSummary(BuildContext context, FlightSearchState state) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.fromCity?.name ?? ''} ➔ ${state.toCity?.name ?? ''}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Madani Arabic',
                      color: const Color(0xFF282A51),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${state.departureDate != null ? DateFormat('dd MMM').format(state.departureDate!) : ''} • ${state.passengerCount} مسافر • ${state.cabinClass}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Madani Arabic',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.edit_outlined, color: Color(0xFFFE406F)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlightCard(itinerary) {
    final outbound = itinerary.outbound;
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Airline Info
          Row(
            children: [
              Image.network(
                itinerary.airline.logo,
                width: 32.w,
                height: 32.h,
                errorBuilder: (_, __, ___) => const Icon(Icons.flight),
              ),
              SizedBox(width: 12.w),
              Text(
                itinerary.airline.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Madani Arabic',
                ),
              ),
              const Spacer(),
              if (itinerary.isCheapest)
                _buildBadge('الأرخص', const Color(0xFF039855)),
            ],
          ),
          SizedBox(height: 20.h),
          
          // Flight Leg Details
          _buildLegRow(outbound),
          
          if (itinerary.returnLeg != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: const Divider(),
            ),
            _buildLegRow(itinerary.returnLeg!),
          ],
          
          SizedBox(height: 20.h),
          const Divider(),
          SizedBox(height: 12.h),
          
          // Price and CTA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السعر الإجمالي',
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                  ),
                  Text(
                    '${itinerary.totalPrice} ${itinerary.currencyCode}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFE406F),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF282A51),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: const Text('اختيار', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegRow(leg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStationTime(leg.origin.code, leg.departureTime),
        Column(
          children: [
            Text(
              leg.totalDuration,
              style: TextStyle(fontSize: 11.sp, color: Colors.grey),
            ),
            SizedBox(
              width: 80.w,
              child: const Divider(thickness: 1),
            ),
            Text(
              leg.stopsLabel,
              style: TextStyle(
                fontSize: 11.sp,
                color: leg.stopsCount > 0 ? Colors.orange : Colors.green,
              ),
            ),
          ],
        ),
        _buildStationTime(leg.destination.code, leg.arrivalTime),
      ],
    );
  }

  Widget _buildStationTime(String code, String timeString) {
    // Basic time formatting
    String time = timeString;
    try {
      final dt = DateTime.parse(timeString);
      time = DateFormat('HH:mm').format(dt);
    } catch (_) {}

    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Madani Arabic',
          ),
        ),
        Text(
          code,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.flight_outlined, size: 60.sp, color: Colors.grey[300]),
          SizedBox(height: 16.h),
          Text(
            'لا توجد رحلات متاحة',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
