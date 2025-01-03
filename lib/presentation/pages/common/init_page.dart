import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/pages/common/start_app_page.dart';
import 'package:reservation_client/presentation/pages/home/home_page.dart';

import '../../../core/services/localDB/local_db_service.dart';


@RoutePage()
class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    if(locator<LocalDBService>().getUser()?.accessToken != null){
      return const HomePage();
    }
    return const StartAppPage();
  }
}