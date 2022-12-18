import 'package:anubandhit/app/modules/homepage/view/tabBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'view/login.dart';

class Decision extends StatefulWidget {
  static const route = '/decision';
  static launch(BuildContext context) => Navigator.of(context).pushNamed(route);
  const Decision({Key? key}) : super(key: key);

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) =>
              snapshot.hasData ? const TabBarWidget() : const Login()),
    );
    // if(user==null){
    //   return const Login();
    // }
    // return TabBarWidget(
    //   // onSignOut: (userCred)=>onRefresh(userCred),
    // );
  }
}
