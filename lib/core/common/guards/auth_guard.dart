import 'package:auto_route/auto_route.dart';

import '../../../presentation/router/rourter.gr.dart';
import '../../services/injectables/locator.dart';
import '../../services/localDB/local_db_service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (locator<LocalDBService>().getUser() != null) {
      resolver.next(true);
    } else {
      resolver.redirect(
        const InitPageRoute(),
      );
    }
  }
}