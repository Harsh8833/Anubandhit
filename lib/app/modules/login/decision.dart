import 'package:anubandhit/app/modules/homepage/view/tabBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'view/login.dart';

class Decision extends StatefulWidget {
  static launch(BuildContext context) => Navigator.of(context).pushNamed('/decision');
  const Decision({Key? key}) : super(key: key);

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  User? user;
  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }
  onRefresh(userCred){
    setState((){
      user=userCred;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(user==null){
      return const Login();
    }
    return TabBarWidget(
      // onSignOut: (userCred)=>onRefresh(userCred),
    );
  }
}
