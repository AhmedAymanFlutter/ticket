import 'package:equatable/equatable.dart';
import 'package:ticket/features/packages/data/models/package_type_model.dart';

abstract class PackageTypesState extends Equatable {
  const PackageTypesState();

  @override
  List<Object?> get props => [];
}

class PackageTypesInitial extends PackageTypesState {}

class PackageTypesLoading extends PackageTypesState {}

class PackageTypesSuccess extends PackageTypesState {
  final List<PackageTypeModel> packageTypes;

  const PackageTypesSuccess({required this.packageTypes});

  @override
  List<Object?> get props => [packageTypes];
}

class PackageTypesFailure extends PackageTypesState {
  final String message;

  const PackageTypesFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
