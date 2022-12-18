import 'dart:developer';

import 'package:anubandhit/helper/loading.dart';
import 'package:anubandhit/helper/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/otp.dart';

class LogInController {
  late String phoneNumber;
  String verification = '';

  onSendOtp(BuildContext context) async {
    showLoading(context, "please wait...");
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    log("Login Started");
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        log(userCredential.user!.uid);
      },
      verificationFailed: (FirebaseAuthException e) {
        // LoadingUtils.hideLoader();
        Navigator.pop(context);
        if (e.code == 'invalid-phone-number') {
          appSnackBar(context, 'The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;
        // LoadingUtils.hideLoader();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpScreen(verification: verification)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // LoadingUtils.hideLoader();
      },
    );
  }
}
