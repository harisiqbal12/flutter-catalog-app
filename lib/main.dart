// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      routes: {
        '/': (context) => HomeScreen(
              key: key,
            ),
        AppRoutes.loginRoute: (context) => LoginScreen(key: key),
        AppRoutes.homeRoute: (context) => HomeScreen(
              key: key,
            ),
      },
    );
  }
}
