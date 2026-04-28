import 'package:equatable/equatable.dart';

class ServiceSettingsModel extends Equatable {
  final String id;
  final List<ServiceContactPhoneModel> phones;

  const ServiceSettingsModel({required this.id, required this.phones});

  factory ServiceSettingsModel.fromJson(Map<String, dynamic> json) {
    return ServiceSettingsModel(
      id: json['_id']?.toString() ?? '',
      phones: (json['contactInfo'] is Map ? json['contactInfo']['phones'] as List<dynamic>? : null)
              ?.whereType<Map<String, dynamic>>()
              .map((e) => ServiceContactPhoneModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [id, phones];
}

class ServiceContactPhoneModel extends Equatable {
  final String id;
  final String number;
  final String label;
  final bool isPrimary;
  final bool isWhatsApp;
  final String countryCode;

  const ServiceContactPhoneModel({
    required this.id,
    required this.number,
    required this.label,
    required this.isPrimary,
    required this.isWhatsApp,
    required this.countryCode,
  });

  factory ServiceContactPhoneModel.fromJson(Map<String, dynamic> json) {
    return ServiceContactPhoneModel(
      id: json['_id']?.toString() ?? '',
      number: json['number']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      isPrimary: json['isPrimary'] == true || json['isPrimary'] == 'true',
      isWhatsApp: json['isWhatsApp'] == true || json['isWhatsApp'] == 'true',
      countryCode: json['countryCode']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
    id,
    number,
    label,
    isPrimary,
    isWhatsApp,
    countryCode,
  ];
}
