import 'specific/specific_constants.dart';

class ApiRoutes {
  static String baseUrl = SpecificConstants.baseUrl;
  static String categoryUrl = SpecificConstants.categoryUrl;
  static String menuUrl = SpecificConstants.menuUrl;
  static String login = '$baseUrl/user-login';
  static String register = '$baseUrl/user-register';
  static String categories = '$baseUrl/categories';
  static String menusCategory(String id) => '$baseUrl/categories/$id';
  static String menus = '$baseUrl/menus';
  static String createReservation = '$baseUrl/create-reservation';
  static String getUser = '$baseUrl/user';
  static String getAvailableTables= '$baseUrl/available-tables';
}
