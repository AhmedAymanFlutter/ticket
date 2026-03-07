import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/activities/presentation/widgets/city_filter_sheet.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
import 'build_textField_widgets.dart';

class StationSelectionSection extends StatelessWidget {
  const StationSelectionSection({super.key});

  void _selectCity(BuildContext context, bool isFrom) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) => BlocProvider.value(
        value: context.read<CitiesCubit>(),
        child: CityFilterBottomSheet(
          selectedCitySlug: isFrom
              ? context.read<FlightSearchCubit>().state.fromCity
              : context.read<FlightSearchCubit>().state.toCity,
          onCitySelected: (slug, name) {
            if (isFrom) {
              context.read<FlightSearchCubit>().updateFromCity(name);
            } else {
              context.read<FlightSearchCubit>().updateToCity(name);
            }
            Navigator.pop(modalContext);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      buildWhen: (previous, current) =>
          previous.fromCity != current.fromCity ||
          previous.toCity != current.toCity,
      builder: (context, state) {
        return Stack(
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
                    value: state.fromCity,
                    onTap: () => _selectCity(context, true),
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                  child: buildField(
                    label: 'flights.to',
                    hint: 'flights.arrival_station',
                    svgPath: 'assets/icons/flight.svg',
                    width: 135.w,
                    value: state.toCity,
                    onTap: () => _selectCity(context, false),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 3.h,
              child: GestureDetector(
                onTap: () => context.read<FlightSearchCubit>().swapStations(),
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
            ),
          ],
        );
      },
    );
  }
}
