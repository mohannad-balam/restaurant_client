import 'specific/specific_constants.dart';

class ApiRoutes {
  static String baseUrl = SpecificConstants.baseUrl;

  static String login = '$baseUrl/user-login';
  static String register = '$baseUrl/user-register';
  static String categpries = '$baseUrl/categories';
  static String menus = '$baseUrl/menus';
  static String createReservation = '$baseUrl/create-reservation';
  static String getUser = '$baseUrl/user';
}
