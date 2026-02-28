import 'package:equatable/equatable.dart';

class AppSettingsModel extends Equatable {
  final String id;
  final ContactInfoModel contactInfo;
  final SocialMediaModel socialMedia;

  const AppSettingsModel({
    required this.id,
    required this.contactInfo,
    required this.socialMedia,
  });

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      id: json['_id'],
      contactInfo: ContactInfoModel.fromJson(json['contactInfo']),
      socialMedia: SocialMediaModel.fromJson(json['socialMedia']),
    );
  }

  @override
  List<Object?> get props => [id, contactInfo, socialMedia];
}

class ContactInfoModel extends Equatable {
  final List<ContactPhoneModel> phones;
  final List<ContactEmailModel> emails;
  final List<String> addresses;

  const ContactInfoModel({
    required this.phones,
    required this.emails,
    required this.addresses,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      phones: (json['phones'] as List)
          .map((e) => ContactPhoneModel.fromJson(e))
          .toList(),
      emails: (json['emails'] as List)
          .map((e) => ContactEmailModel.fromJson(e))
          .toList(),
      addresses: List<String>.from(json['addresses']),
    );
  }

  @override
  List<Object?> get props => [phones, emails, addresses];
}

class ContactPhoneModel extends Equatable {
  final String id;
  final String number;
  final String label;
  final bool isPrimary;
  final bool isWhatsApp;
  final String countryCode;

  const ContactPhoneModel({
    required this.id,
    required this.number,
    required this.label,
    required this.isPrimary,
    required this.isWhatsApp,
    required this.countryCode,
  });

  factory ContactPhoneModel.fromJson(Map<String, dynamic> json) {
    return ContactPhoneModel(
      id: json['_id'],
      number: json['number'],
      label: json['label'],
      isPrimary: json['isPrimary'],
      isWhatsApp: json['isWhatsApp'],
      countryCode: json['countryCode'],
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

class ContactEmailModel extends Equatable {
  final String id;
  final String email;
  final String label;
  final bool isPrimary;
  final String department;

  const ContactEmailModel({
    required this.id,
    required this.email,
    required this.label,
    required this.isPrimary,
    required this.department,
  });

  factory ContactEmailModel.fromJson(Map<String, dynamic> json) {
    return ContactEmailModel(
      id: json['_id'],
      email: json['email'],
      label: json['label'],
      isPrimary: json['isPrimary'],
      department: json['department'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, email, label, isPrimary, department];
}

class SocialMediaModel extends Equatable {
  final SocialMediaItemModel facebook;
  final SocialMediaItemModel instagram;
  final SocialMediaItemModel twitter;
  final SocialMediaItemModel whatsApp;

  const SocialMediaModel({
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.whatsApp,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      facebook: SocialMediaItemModel.fromJson(json['facebook']),
      instagram: SocialMediaItemModel.fromJson(json['instagram']),
      twitter: SocialMediaItemModel.fromJson(json['twitter']),
      whatsApp: SocialMediaItemModel.fromJson(json['whatsApp']),
    );
  }

  @override
  List<Object?> get props => [facebook, instagram, twitter, whatsApp];
}

class SocialMediaItemModel extends Equatable {
  final String name;
  final String url;

  const SocialMediaItemModel({required this.name, required this.url});

  factory SocialMediaItemModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaItemModel(name: json['name'], url: json['url']);
  }

  @override
  List<Object?> get props => [name, url];
}
