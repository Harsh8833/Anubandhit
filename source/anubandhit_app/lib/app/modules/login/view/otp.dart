import 'dart:developer';

import 'package:anubandhit/app/modules/categories/view/categories.dart';
import 'package:anubandhit/app/modules/homepage/view/homepage.dart';
import 'package:anubandhit/helper/loading.dart';
import 'package:anubandhit/helper/shared_preferences.dart';
import 'package:anubandhit/helper/snackbar.dart';
import 'package:anubandhit/widgets/big_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/button.dart';

class OtpScreen extends StatelessWidget {
  String verification;
  late String phoneOtp;
  final spcontroller = SPController();
  OtpScreen({super.key, required this.verification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Dimensions.width20, Dimensions.height10,
            Dimensions.width20, Dimensions.height40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: Dimensions.height40,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CircleAvatar(
                      backgroundColor: AppColors.orange,
                      radius: Dimensions.radius20 * 2,
                      child: Icon(
                        Icons.mic,
                        color: AppColors.white,
                        size: Dimensions.iconSize24,
                      ))
                ]),
              ),
            ),
            Expanded(
                child: Image.network(
                    'https://cdni.iconscout.com/illustration/premium/thumb/otp-security-4120631-3427365.png')),
            SizedBox(
              height: Dimensions.height15,
            ),
            Column(
              children: [
                SizedBox(
                  width: Dimensions.width40 * 8,
                  height: Dimensions.height40 * 1.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: PinCodeTextField(
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(15),
                            activeColor: AppColors.orange,
                            inactiveColor: AppColors.lightOrange,
                            selectedColor: AppColors.orange),
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          phoneOtp = value;
                        }),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: BigText(
                      text: 'Resend Otp',
                      color: AppColors.grey,
                      size: Dimensions.font20 / 1.5,
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: BigText(
                      text: 'Change Mobile Number?',
                      color: AppColors.orange,
                      size: Dimensions.font20 / 1.5,
                    )),
                Button(
                  on_pressed: () async {
                    try {
                      showLoading(context, "please wait...");
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verification, smsCode: phoneOtp);
                      var userCredential = await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      if (userCredential.user?.uid != null) {
                        spcontroller.setLabourId(userCredential.user!.uid);
                        spcontroller.setIsLoggedin(true);
                        var existingLabour = FirebaseFirestore.instance
                            .collection('labours')
                            .where('labour_id',
                                isEqualTo: userCredential.user!.uid)
                            .get()
                            .then(
                          (res) {
                            print("Existing Labours");
                            HomePage.launch(context);
                          },
                          onError: (e) => Categories.launch(context),
                        );
                      }

                      // ignore: use_build_context_synchronously

                    } catch (e) {
                      print(e);
                      appSnackBar(context, e.toString());
                    }
                  },
                  text: 'LogIn',
                  width: Dimensions.width40 * 8,
                  height: Dimensions.height40 * 1.5,
                  radius: Dimensions.radius20,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
