import 'specific/specific_constants.dart';

class ApiRoutes {
  static String baseUrl = SpecificConstants.baseUrl;
  static String categoryUrl = SpecificConstants.categoryUrl;
  static String menuUrl = SpecificConstants.menuUrl;
  static String login = '$baseUrl/user-login';

  /// categories
  static String categories = '$baseUrl/categories';
  static String createCategory = '$baseUrl/create-category';
  static String updateCategory(String id) => '$baseUrl/update-category/$id';
  static String deleteCategory(String id) => '$baseUrl/delete-category/$id';
  static String menusCategory(String id) => '$baseUrl/get-categories/$id';

  /// menus
  static String menus = '$baseUrl/get-menus';
  static String createMenu = '$baseUrl/create-menu';
  static String updateMenu(String id) => '$baseUrl/update-menu/$id';
  static String deleteMenu(String id) => '$baseUrl/delete-menu/$id';

  /// tables
  static String tables = '$baseUrl/get-tables';
  static String createTable = '$baseUrl/create-table';
  static String updateTable(String id) => '$baseUrl/update-table/$id';
  static String deleteTable(String id) => '$baseUrl/delete-table/$id';

  /// reservations
  static String reservations = '$baseUrl/get-reservations';
  static String createReservation = '$baseUrl/create-reservation';
  static String updateReservation(String id) =>
      '$baseUrl/update-reservation/$id';
  static String deleteReservation(String id) =>
      '$baseUrl/delete-reservation/$id';

  // static String menus = '$baseUrl/admin-menus';
  // static String createReservation = '$baseUrl/admin-reservations';
  static String getUser = '$baseUrl/user';
  static String getAvailableTables = '$baseUrl/admin-tables';
}
