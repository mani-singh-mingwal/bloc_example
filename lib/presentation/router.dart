import 'package:block_example_two/presentation/screens/home_screen.dart';
import 'package:block_example_two/presentation/screens/second_screen.dart';
import 'package:block_example_two/presentation/screens/settings_screen.dart';
import 'package:block_example_two/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: "Home Screen", color: Colors.blue));
      case "/secondScreen":
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: "Second Screen", color: Colors.redAccent));
      case "/thirdScreen":
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: "Third Screen", color: Colors.greenAccent));
      case "/settingsScreen":
        return MaterialPageRoute(builder: (_) {
          return const SettingsScreen(title: "Settings Screen");
        });
      default:
        return null;
      // return MaterialPageRoute(
      //     builder: (_) => Container(
      //           color: Colors.white,
      //           alignment: Alignment.center,
      //           child: const Text(
      //             "No route found",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ));
    }
  }
}
