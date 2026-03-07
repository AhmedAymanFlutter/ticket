import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
  static const String _defaultWhatsAppNumber =
      '201016629864'; // Fallback number if settings are missing

  /// Launches WhatsApp with a specific number and optional message.
  static Future<void> launchWhatsApp({
    String? number,
    String message = '',
  }) async {
    final cleanNumber = (number ?? _defaultWhatsAppNumber).replaceAll(
      RegExp(r'[^\d]'),
      '',
    );

    final whatsappUrl = Uri.parse(
      'https://wa.me/$cleanNumber?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  /// Formats a WhatsApp URL from a number.
  static String getWhatsAppUrl(String number, [String message = '']) {
    final cleanNumber = number.replaceAll(RegExp(r'[^\d]'), '');
    return 'https://wa.me/$cleanNumber?text=${Uri.encodeComponent(message)}';
  }

  /// Extracts the phone number from a wa.me or whatsapp.com URL.
  static String? extractPhoneNumber(String url) {
    if (url.isEmpty) return null;

    // Try to extract from wa.me/number
    final waMeMatch = RegExp(r'wa\.me/(\d+)').firstMatch(url);
    if (waMeMatch != null) return waMeMatch.group(1);

    // Try to extract from api.whatsapp.com/send?phone=number
    final apiMatch = RegExp(r'phone=(\d+)').firstMatch(url);
    if (apiMatch != null) return apiMatch.group(1);

    return null;
  }

  /// Launches a phone call.
  static Future<void> launchCall(String phone) async {
    final url = Uri.parse('tel:${phone.replaceAll(RegExp(r'[^\d+]'), '')}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  /// Launches an email client.
  static Future<void> launchEmail(String email) async {
    final url = Uri.parse('mailto:$email');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  /// Launches Google Maps with a query.
  static Future<void> launchMap(String query) async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  /// Launches a generic URL.
  static Future<void> launchBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
