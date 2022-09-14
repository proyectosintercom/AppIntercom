import 'package:appintercom/src/repository/UI/home_screen.dart';
import 'package:appintercom/src/repository/UI/intro_screen.dart';
import 'package:appintercom/src/repository/UI/login.dart';
import 'package:appintercom/src/repository/UI/splash_screen.dart';
import 'package:appintercom/src/repository/UI/intro/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:appintercom/src/repository/UI/create_account.dart';
class Routes
{
  static const splash = '/';
  static const intro ='intro';
  static const login='/login';
  static const home ='/home';
  static const crear ='/Createaccount';


  static Route routes(RouteSettings routeSettings)
  {
    switch(routeSettings.name){
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(OnBoardingAnimationExample.create);
      case home:
        return _buildRoute(HomeScreen.create);
      case login:
        return _buildRoute(PaginaLogin.create);
      case crear:
        return _buildRoute(Createaccount.create);
      default:
        throw Exception('Ruta no existe');
    }
  }
  static MaterialPageRoute _buildRoute(Function build)=> MaterialPageRoute(builder: (context)=>build(context));


}