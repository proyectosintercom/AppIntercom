import 'package:appintercom/src/repository/UI/home_screen.dart';
import 'package:appintercom/src/repository/UI/intro_screen.dart';
import 'package:appintercom/src/repository/UI/splash_screen.dart';
import 'package:flutter/material.dart';
class Routes
{
  static const splash = '/';
  static const intro ='intro';
  static const home ='/home';

  static Route routes(RouteSettings routeSettings)
  {
    switch(routeSettings.name){
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      default:
        throw Exception('Ruta no existe');
    }
  }
  static MaterialPageRoute _buildRoute(Function build)=> MaterialPageRoute(builder: (context)=>build(context));


}