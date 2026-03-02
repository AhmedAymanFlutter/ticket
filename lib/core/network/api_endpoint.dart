abstract class EndPoints {
  static const String baseUrl = 'http://192.168.1.230:3001/api/v1';
  static const String refreshToken = 'refreshToken';
  static const String services = '/services';
  static const String settings = '/settings';
  static const String contact = '/contact';
  static const String countries = '/countries';
  static String countryDetails(String slug) => '/countries/$slug';
  static String guideDetails(String slug) => '/guides/$slug';
}
