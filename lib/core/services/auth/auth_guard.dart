// import '../../../core/constant/flags.dart';
// import '../../constant/roles.dart';
// import '../../utils/helpers/helpers.dart';
// import '../localDB/local_db_service.dart';
// import 'package:auto_route/auto_route.dart';
// import '../injectables/locator.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     if (locator<LocalDBService>().getUser() != null &&
//         (HelpUtils.findRole(role: Roles.roleClient) ||
//             HelpUtils.findRole(role: Roles.rolePos))) {
//       // Allow navigation if the user is authenticated
//       resolver.next(true);
//       // } else {
//       //   // resolver.redirect(

//       //   // );
//       // }
//     }
//   }
// }
