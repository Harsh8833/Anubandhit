import 'package:anubandhit/app/modules/homepage/view/homepage.dart';
import 'package:anubandhit/app/modules/profile/create_profile/view/create_profile.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:anubandhit/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/big_text.dart';

class Categories extends StatefulWidget {
  static launch(BuildContext context) => Navigator.of(context).pushNamed('/categories');
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool onCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: Dimensions.height15),
                  BigText(
                    text: 'Categories',
                    size: Dimensions.font26 * 1.23,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: Dimensions.height15),
                  Expanded(
                      child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: ((context, index) => SizedBox(
                              height: Dimensions.height10 * 14,
                              width: Dimensions.height10 * 14,
                              child: Card(
                                margin: EdgeInsets.all(Dimensions.height10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20)),
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.height10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CheckBoxWidget(
                                              isChecked: onCheck)),
                                      Expanded(
                                          child: Image.network(
                                              'https://en.pimg.jp/064/070/508/1/64070508.jpg')),
                                      BigText(
                                        text: 'Construction Worker',
                                        size: Dimensions.font20 / 1.5,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  ),
                                ),
                              ))))),
                  Center(
                      child: Button(
                    on_pressed: () {
                      CreateProfilePage.launch(context);
                    },
                    text: 'Continue',
                    width: Dimensions.width40 * 3,
                    height: Dimensions.height40 * 1.5,
                  )),
                ],
              ))),
    );
  }
}
