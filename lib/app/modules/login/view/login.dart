import 'package:anubandhit/app/modules/login/controller/login_controller.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class Login extends StatefulWidget {
  static const route = '/login';
  static launch(BuildContext context) => Navigator.of(context).pushNamed(route);
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LogInController controller=LogInController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  Dimensions.width20,
                  Dimensions.height10,Dimensions.width20,Dimensions.height40),
                  child: Column(
                    
                    children: [
                      Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: Dimensions.height40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                  Expanded(child: Image.network('https://cdn3d.iconscout.com/3d/premium/thumb/user-login-5000917-4165668.png')),
                  SizedBox(
                        height: Dimensions.height15,
                      ),
                  Column(
                    children: [
                      Container(
                        width: Dimensions.width40*8,
                        height: Dimensions.height40*1.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.lightOrange
                        ),
                        child:Center(
                          child: TextField(
                            onChanged: (value){
                              controller.phoneNumber=value;
                            },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.call,color: AppColors.orange,),

                          ),
                      ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Button(on_pressed: ()async{
                      /*setState(() {
                        CircularProgressIndicator();
                      });*/
                        await controller.onSendOtp(context);
                        
                      }, text: 'Send OTP',width: Dimensions.width40*8,
                        height: Dimensions.height40*1.5,radius: Dimensions.radius20,)
                    ],
                  )
                    ],
                  ),
                  )),
    );
  }
}
