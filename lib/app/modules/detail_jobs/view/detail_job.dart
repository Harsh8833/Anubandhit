import 'package:anubandhit/utils/dimensions.dart';
import 'package:anubandhit/widgets/big_text.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:anubandhit/widgets/key_value_text.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class DetailJob extends StatefulWidget {
  static const route = '/detailJob';
  static launch(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(route);
  const DetailJob({super.key});

  @override
  State<DetailJob> createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: Dimensions.iconSize24 * 1.2,
                    )),
                SizedBox(
                  height: Dimensions.height40,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
              ],
            ),
            Expanded(
                child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Card(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  child: Image.network(
                      'https://www.constructionexec.com/assets/site_18/images/article/081219110833.jpg?width=1280',
                      fit: BoxFit.fill),
                ),
              ),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Column(
                    children: [
                      BigText(
                        text: 'Construction XYZ',
                        fontWeight: FontWeight.bold,
                        size: Dimensions.font26,
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BigText(
                            text: 'Vacancy  ',
                            size: Dimensions.font15 / 1.1,
                            fontWeight: FontWeight.bold,
                          ),
                          BigText(
                            text: '120',
                            size: Dimensions.font15,
                            color: AppColors.orange,
                          ),
                          BigText(
                            text: '/200',
                            size: Dimensions.font15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: BigText(
                              text: 'Construction Worker',
                              fontWeight: FontWeight.bold,
                              size: Dimensions.font26 * 0.8)),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.language_outlined,
                          keyText: ' Location :  ',
                          value:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.calendar_month_outlined,
                          keyText: ' Duration :  ',
                          value: '3 months'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.paid_outlined,
                          keyText: ' Pay :  ',
                          value: '₹650/day'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.lock,
                          keyText: ' Company :  ',
                          value: 'XYZ Steel pvt. ltd'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.checklist_outlined,
                          keyText: ' Eligibility :  ',
                          value: 'Physically fit individual for manual work.'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline_outlined,
                            color: AppColors.deepGreen,
                          ),
                          BigText(
                            text: 'Payment Verified',
                            size: Dimensions.font20 * .7,
                            color: AppColors.deepGreen,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            on_pressed: () {},
                            text: 'Apply Now',
                            width: Dimensions.width40 * 3,
                            height: Dimensions.height40 * 1.5,
                            textSize: Dimensions.font20 * .8,
                            radius: Dimensions.radius20,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
