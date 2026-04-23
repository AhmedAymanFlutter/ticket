abstract class EndPoints {
  static const String baseUrl = 'http://192.168.1.230:3001/api/v1/mobile/';
  static const String serverClientId =
      '742535730094-ljv9dcdntv3afkacp0hhfsdrl64r2t9v.apps.googleusercontent.com';
  static const String refreshToken = 'refreshToken';
  static const String services = '/services';
  static const String settings = '/settings';
  static const String contact = '/contacts';
  static const String countries = '/countries';
  static String countryDetails(String slug) => '/countries/slug/$slug';
  static String guideDetails(String slug) => '/guides/$slug';
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String getMe = '/auth/me';
  static const String sendOtp = '/auth/send-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = "/auth/verify-otp";
  static const String googleLogin = '/auth/login-google';
  static const String facebookLogin = '/auth/login-facebook';
  static const String hotels = '/hotels';
  static String hotelDetails(dynamic id) => '/hotels/$id';
  static const String flightSearchDestination = 'flights/search-destination';
  static const String flightAirlines = 'airlines';
  static const String flightSearch = 'flights/search';
}
