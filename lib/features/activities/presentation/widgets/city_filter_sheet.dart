import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/home/presentation/manager/cities_state.dart';

class CityFilterBottomSheet extends StatelessWidget {
  final String? selectedCitySlug;
  final void Function(String slug, String name) onCitySelected;

  const CityFilterBottomSheet({
    super.key,
    required this.selectedCitySlug,
    required this.onCitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 400.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select City',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
                if (state is CitiesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CitiesFailure) {
                  return Center(child: Text(state.message));
                } else if (state is CitiesSuccess) {
                  if (state.cities.isEmpty) {
                    return const Center(child: Text('No cities found'));
                  }

                  return ListView.builder(
                    itemCount: state.cities.length,
                    itemBuilder: (context, index) {
                      final city = state.cities[index];
                      final isSelected = selectedCitySlug == city.slug;
                      return ListTile(
                        title: Text(city.name),
                        trailing: isSelected
                            ? const Icon(Icons.check, color: Colors.blue)
                            : null,
                        onTap: () {
                          onCitySelected(city.slug, city.name);
                        },
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
