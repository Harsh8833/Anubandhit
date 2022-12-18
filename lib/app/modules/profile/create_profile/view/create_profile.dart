// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:anubandhit/app/modules/homepage/view/tabBar.dart';
import 'package:anubandhit/utils/colors.dart';
import 'package:anubandhit/widgets/big_text.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:anubandhit/widgets/snackbar.dart';
import 'package:anubandhit/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../../utils/dimensions.dart';

class CreateProfilePage extends StatefulWidget {
  static const route = '/create-profile';
  static launch(BuildContext context) =>
      Navigator.pushNamed(context, route);
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final List<String> bankList = ['HDFC', 'ICICI', 'SBI', 'Swiss Bank'];
  String? selectedValue;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController adahaarNumberController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    panNumberController.dispose();
    adahaarNumberController.dispose();
    bankNameController.dispose();
    super.dispose();
  }

  final Function(User?) x = (User) {
    FirebaseAuth.instance.currentUser;
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: Column(children: [
            SizedBox(
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
            SizedBox(
              height: Dimensions.height40 * 2.8,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.grey,
                      radius: Dimensions.radius30 * 1.6,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.orange),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: AppColors.white,
                              ),
                              border: InputBorder.none,
                              labelText: 'Full Name'),
                        ),
                      ),
                    ))
              ]),
            ),
            SizedBox(
              height: Dimensions.height10 / 2,
            ),
            SizedBox(
              child: Text_Field(
                  text_field: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: AppColors.orange,
                  ),
                  border: InputBorder.none,
                  labelText: 'Mobile Number',
                ),
              )),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            SizedBox(
              child: Text_Field(
                  text_field_height: Dimensions.height40 * 4,
                  text_field: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: AppColors.orange,
                      ),
                      border: InputBorder.none,
                      labelText: 'Address',
                    ),
                  )),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            SizedBox(
              child: Text_Field(
                  text_field: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.credit_score,
                    color: AppColors.orange,
                  ),
                  border: InputBorder.none,
                  labelText: 'PAN Card Number',
                ),
              )),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            SizedBox(
              child: Text_Field(
                  text_field: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.description,
                    color: AppColors.orange,
                  ),
                  border: InputBorder.none,
                  labelText: 'Aadhaar Number',
                ),
              )),
            ),
            SizedBox(
              height: Dimensions.height10 / 2,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BigText(text: 'Payment Details'),
                SizedBox(
                  width: Dimensions.width30 * 6,
                  child: Divider(
                    color: AppColors.lightGrey,
                    thickness: Dimensions.height10 / 5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20 * 5.5,
              child: Container(
                width: Dimensions.text_field_width,
                margin: EdgeInsets.symmetric(vertical: Dimensions.width30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius20 / 2)),
                  border: Border.all(color: AppColors.orange),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,

                      hint: Text(
                        'Bank Name',
                        style: TextStyle(
                          fontSize: Dimensions.font15,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: bankList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: Dimensions.height40,
                      buttonWidth: Dimensions.width40 * 5,
                      itemHeight: Dimensions.height40,
                      dropdownMaxHeight: Dimensions.height40 * 5,
                      searchController: bankNameController,
                      searchInnerWidget: Padding(
                        padding: EdgeInsets.only(
                          top: Dimensions.height40 / 5,
                          bottom: Dimensions.height40 / 10,
                          right: Dimensions.height40 / 5,
                          left: Dimensions.height40 / 5,
                        ),
                        child: TextFormField(
                          controller: bankNameController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height10,
                              vertical: Dimensions.height40 / 5,
                            ),
                            hintText: 'Search for Your Bank...',
                            hintStyle:
                                TextStyle(fontSize: Dimensions.font26 / 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius20 / 2.5),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          bankNameController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Button(
              on_pressed: () async {
                if (nameController.text.isEmpty) {
                  appSnackBar(context, "Please enter your name");
                } else if (phoneController.text.isEmpty) {
                  appSnackBar(context, "Please enter your phone");
                } else if (addressController.text.isEmpty) {
                  appSnackBar(context, "Please enter your address");
                } else {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => TabBarWidget()),
                  //     (Route route) => false);
                }
              },
              text: 'Continue',
              width: Dimensions.screenWidth * 0.8,
            )
          ]),
        ),
      ),
    );
  }
}
