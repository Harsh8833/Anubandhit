import 'package:flutter/material.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/big_text.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
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
                ),            )
,
            SizedBox(height: Dimensions.height15),
            BigText(text: 'Categories',size: Dimensions.font26*1.23,
                      fontWeight: FontWeight.bold,),
                      SizedBox(height: Dimensions.height15),
                      Expanded(child: GridView.builder(
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ), itemBuilder: ((context, index) =>SizedBox(
                        height: Dimensions.height10*14,
                        width: Dimensions.height10*14,
                        child: Card(
                        margin: EdgeInsets.all(Dimensions.height10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius20)),
                        elevation: 8,
                      )))))          ],
        )
      )),
    );
  }
}