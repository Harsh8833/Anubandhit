import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../helper/loading.dart';
import '../view/otp.dart';

class LogInController {
  late String phoneNumber;
  String verification = '';
  onSendOtp(BuildContext context) async {
    LoadingUtils.showLoader();

    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        LoadingUtils.hideLoader();
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;
        LoadingUtils.hideLoader();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpScreen(verification: verification)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        LoadingUtils.hideLoader();
      },
    );
  }
}
