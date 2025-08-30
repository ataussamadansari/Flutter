import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';

class RouteHelper {
  static myRoute() {
    return {
      '/': (context) => HomeScreen(),
      // '/profile' : (context) => ProfileScreen(),
      // '/settings' : (context) => SettingsScreen(),
    };
  }

  static myOnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/profile':
        {
          String name = settings.arguments as String;
          return MaterialPageRoute(builder: (context) {
            return ProfileScreen(name: name);
          });
        }
      case '/settings':
        {
          Map<String, dynamic> data = settings.arguments as Map<String,
              dynamic>;
          return MaterialPageRoute(builder: (context) {
            return SettingsScreen(
                name: data['name'], email: data['email'], age: data['age']);
          });
        }
    }
  }
}