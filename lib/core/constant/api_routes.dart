import 'specific/specific_constants.dart';

class ApiRoutes {
  static String baseUrl = SpecificConstants.baseUrl;
  static String categoryUrl = SpecificConstants.categoryUrl;
  static String menuUrl = SpecificConstants.menuUrl;
  static String login = '$baseUrl/user-login';

  /// categories
  static String categories = '$baseUrl/categories';
  static String createCategory = '$baseUrl/create-category';
  static String updateCategory(String id) => '$baseUrl/admin-categories/$id';
  static String deleteCategory(String id) => '$baseUrl/admin-categories/$id';

  /// end categories
  static String menusCategory(String id) => '$baseUrl/admin-categories/$id';
  static String menus = '$baseUrl/admin-menus';
  static String createReservation = '$baseUrl/admin-reservations';
  static String getUser = '$baseUrl/user';
  static String getAvailableTables = '$baseUrl/admin-tables';
}
