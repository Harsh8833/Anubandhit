import 'dart:developer';

import 'package:anubandhit/app/modules/homepage/view/homepage.dart';
import 'package:anubandhit/app/modules/login/view/login.dart';
import 'package:anubandhit/app/modules/profile/create_profile/view/create_profile.dart';
import 'package:anubandhit/helper/shared_preferences.dart';
import 'package:anubandhit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final spcontroller = SPController();
    bool isLoggedin = spcontroller.getIsLoggedin();
    log(isLoggedin.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anubandhit',
      theme: MyTheme.lightTheme(context),
      routes: appRoutes(),
      initialRoute: (isLoggedin) ? HomePage.route : Login.route,
    );
  }
}
