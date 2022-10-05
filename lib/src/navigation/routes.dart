import 'package:appintercom/src/UI/home_screen.dart';
import 'package:appintercom/src/UI/intro_screen.dart';
import 'package:appintercom/src/UI/login.dart';
import 'package:appintercom/src/UI/register.dart';
import 'package:appintercom/src/UI/splash_screen.dart';
import 'package:appintercom/src/UI/intro/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:appintercom/src/UI/create_account.dart';

class Routes {
  static const splash = '/';
  static const intro = 'intro';
  static const login = '/login';
  static const home = '/home';
  static const crear = '/Createaccount';
  static const registrar = 'MyRegister';

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
        return _buildRoute(MyRegister.create);

      default:
        throw Exception('Ruta no existe');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
