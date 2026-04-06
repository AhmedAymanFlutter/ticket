import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/flights/presentation/manager/flight_search_cubit.dart';
import 'package:ticket/features/flights/presentation/manager/flight_search_state.dart';

class FlightDestinationSearchSheet extends StatefulWidget {
  final bool isFrom;

  const FlightDestinationSearchSheet({super.key, required this.isFrom});

  @override
  State<FlightDestinationSearchSheet> createState() =>
      _FlightDestinationSearchSheetState();
}

class _FlightDestinationSearchSheetState
    extends State<FlightDestinationSearchSheet> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Text(
            widget.isFrom ? 'flights.from'.tr() : 'flights.to'.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _searchController,
            onChanged: (query) {
              context.read<FlightSearchCubit>().searchDestinations(query);
            },
            decoration: InputDecoration(
              hintText: 'flights.search_hint'.tr(),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<FlightSearchCubit, FlightSearchState>(
              builder: (context, state) {
                if (state.isSearching) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessage != null && state.searchResults.isEmpty) {
                  return Center(child: Text(state.errorMessage!));
                }

                if (state.searchResults.isEmpty) {
                  return Center(child: Text('flights.no_results'.tr()));
                }

                return ListView.builder(
                  itemCount: state.searchResults.length,
                  itemBuilder: (context, index) {
                    final destination = state.searchResults[index];
                    return ListTile(
                      leading: const Icon(Icons.flight_takeoff),
                      title: Text(destination.name),
                      subtitle: Text('${destination.cityName}, ${destination.countryName}'),
                      trailing: Text(destination.code, style: const TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        if (widget.isFrom) {
                          context.read<FlightSearchCubit>().updateFromCity(destination);
                        } else {
                          context.read<FlightSearchCubit>().updateToCity(destination);
                        }
                        context.read<FlightSearchCubit>().clearSearchResults();
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
