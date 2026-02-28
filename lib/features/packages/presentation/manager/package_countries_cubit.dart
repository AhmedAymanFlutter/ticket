import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/packages/domain/repositories/packages_repository.dart';
import 'package:ticket/features/packages/presentation/manager/package_countries_state.dart';

class PackageCountriesCubit extends Cubit<PackageCountriesState> {
  final PackagesRepository repository;

  PackageCountriesCubit({required this.repository})
    : super(PackageCountriesInitial());

  Future<void> getPackageCountries(String slug, String lang) async {
    emit(PackageCountriesLoading());
    final result = await repository.getPackageTypeCountries(slug, lang);
    result.fold(
      (failure) =>
          emit(const PackageCountriesFailure('Failed to fetch countries')),
      (countries) => emit(PackageCountriesSuccess(countries)),
    );
  }
}
