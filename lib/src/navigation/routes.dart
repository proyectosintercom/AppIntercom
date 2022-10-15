import 'package:appintercom/src/UI/home_screen.dart';
import 'package:appintercom/src/UI/login.dart';
import 'package:appintercom/src/UI/register_contract.dart';

import 'package:appintercom/src/UI/splash_screen.dart';
import 'package:appintercom/src/UI/intro/onboarding.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = '/';
  static const intro = 'intro';
  static const login = '/login';
  static const home = '/home';
  static const crear = '/Createaccount';
  static const registrar = 'register_contract';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(OnBoardingAnimationExample.create);
      case home:
        return _buildRoute(HomeScreen.create);
      case login:
        return _buildRoute(PaginaLogin.create);

      case registrar:
        return _buildRoute(register_contract.create);

      default:
        throw Exception('Ruta no existe');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
