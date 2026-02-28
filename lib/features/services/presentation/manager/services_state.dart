import 'package:equatable/equatable.dart';
import 'package:ticket/features/services/data/models/service_model.dart';
import 'package:ticket/features/services/data/models/service_settings_model.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object?> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final List<ServiceModel> services;
  final ServiceSettingsModel settings;

  const ServicesSuccess({required this.services, required this.settings});

  @override
  List<Object?> get props => [services, settings];
}

class ServicesFailure extends ServicesState {
  final String message;

  const ServicesFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
