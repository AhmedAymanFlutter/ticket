import 'package:equatable/equatable.dart';
import 'package:ticket/features/packages/data/models/package_type_country_model.dart';

abstract class PackageCountriesState extends Equatable {
  const PackageCountriesState();

  @override
  List<Object?> get props => [];
}

class PackageCountriesInitial extends PackageCountriesState {}

class PackageCountriesLoading extends PackageCountriesState {}

class PackageCountriesSuccess extends PackageCountriesState {
  final List<PackageTypeCountryModel> countries;

  const PackageCountriesSuccess(this.countries);

  @override
  List<Object?> get props => [countries];
}

class PackageCountriesFailure extends PackageCountriesState {
  final String message;

  const PackageCountriesFailure(this.message);

  @override
  List<Object?> get props => [message];
}
