import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:living_with_guru/app/screens/home/home_view.dart';
import 'package:living_with_guru/app/screens/login/login_view.dart';
import 'package:living_with_guru/app/screens/pages.dart';
import 'package:living_with_guru/app/screens/register/register_view.dart';

class Router {
  final RouteObserver<PageRoute> routeObserver;

  Router() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.home:
        return _buildRoute(settings, HomePage());
      case Pages.login:
        return _buildRoute(settings, LoginPage());
      case Pages.register:
        return _buildRoute(settings, RegisterPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
