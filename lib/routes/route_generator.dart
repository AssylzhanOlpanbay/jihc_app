import 'package:flutter/material.dart';
import 'package:practice_project/buhgalterPage/buhgalter_page.dart';
import 'package:practice_project/homePage/home.dart';
import 'package:practice_project/logInPage/log_in_page.dart';
import 'package:practice_project/logInPage/registration_page.dart';
import 'package:practice_project/main_video.dart';
import 'package:practice_project/profilePage/profile_page.dart';
import 'package:practice_project/universities_page.dart';

import 'app_roures.dart';

class RouteGenerator {
  static Route<Object?>? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    switch (routeName) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomePage();
            // return MainPage(userCredential: userCredential);
          },
        );

      case AppRoutes.buhgalter:
        // final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return const MyBuhgalter();
          },
        );

      case AppRoutes.video:
        // final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return MyVideoPage();
          },
        );

      case AppRoutes.university:
        // final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return const UniversityApp();
          },
        );

      case AppRoutes.login:
        // final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return LogInPage();
          },
        );

      case AppRoutes.registeration:
        // final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return RegistrationPage();
          },
        );

      case AppRoutes.profile:
        final data = settings.arguments as List;

        return MaterialPageRoute(
          builder: (context) {
            return ProfilePage(
                photo_link: data[0],
                id: data[1],
                name: data[2],
                group: data[3],
                profession: data[4],
                iin: data[5]);
          },
        );

      //   case AppRoutes.home:
      //     return MaterialPageRoute(
      // //       builder: (context) {
      // //         //return MainPage();
      // //         // return MainPage(userCredential: userCredential);
      // // },
      //     );

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 450.0,
                  width: 450.0,
                  // child: Lottie.asset('assets/lottie/error.json'),
                ),
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
