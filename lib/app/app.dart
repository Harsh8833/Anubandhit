import 'package:anubandhit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      routes: appRoutes(),
      initialRoute: '/decision',
    );
  }
}
