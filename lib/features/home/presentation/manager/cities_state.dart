import 'package:equatable/equatable.dart';
import 'package:ticket/features/home/data/models/city_model.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesSuccess extends CitiesState {
  final List<CityModel> cities;

  const CitiesSuccess({required this.cities});

  @override
  List<Object> get props => [cities];
}

class CitiesFailure extends CitiesState {
  final String message;

  const CitiesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
