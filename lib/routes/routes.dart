import 'package:anubandhit/app/modules/categories/view/categories.dart';
import 'package:anubandhit/app/modules/homepage/view/homepage.dart';
import 'package:anubandhit/app/modules/login/decision.dart';
import 'package:anubandhit/app/modules/login/view/login.dart';
import 'package:anubandhit/app/modules/profile/create_profile/view/create_profile.dart';
import 'package:flutter/material.dart';
import '../app/modules/detail_jobs/view/detail_job.dart';
import '../app/modules/homepage/view/tabBar.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    HomePage.route: (context) => HomePage(),
    DetailJob.route: (context) => const DetailJob(),
    Login.route: (context) => const Login(),
    Categories.route: (context) => const Categories(),
    CreateProfilePage.route: (context) => const CreateProfilePage(),
    TabBarWidget.route: (context) => const TabBarWidget(),
  };
}
