import 'package:app/views/auth/screens/forgotpassword.dart';
import 'package:app/views/auth/screens/login.dart';
import 'package:app/views/auth/screens/register.dart';
import 'package:app/views/home/screens/homepage.dart';
import 'package:app/views/home/screens/notification.dart';
import 'package:app/views/home/screens/searchpage.dart';
import 'package:app/views/upload/screens/uploadPage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );

    case RegisterPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterPage(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
        settings: routeSettings,
      );
    case SearchPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SearchPage(),
        settings: routeSettings,
      );
    case Notifications.routeName:
      return MaterialPageRoute(
        builder: (_) => const Notifications(),
        settings: routeSettings,
      );
    case UploadPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const UploadPage(),
        settings: routeSettings,
      );
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
          settings: routeSettings);
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(),
      );
  }
}
