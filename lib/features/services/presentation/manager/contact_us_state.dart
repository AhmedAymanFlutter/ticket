import 'package:equatable/equatable.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object?> get props => [];
}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {
  final AppSettingsModel settings;

  const ContactUsSuccess(this.settings);

  @override
  List<Object?> get props => [settings];
}

class ContactUsFailure extends ContactUsState {
  final String message;

  const ContactUsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
