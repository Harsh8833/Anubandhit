// ignore_for_file: non_constant_identifier_names

import 'package:anubandhit/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class Text_Field extends StatelessWidget {
  final Widget text_field;
  double text_field_height;
   Text_Field({Key? key, required this.text_field, this.text_field_height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.text_field_width,
      height: text_field_height==0 ? Dimensions.text_field_height50 : text_field_height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.orange),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: text_field,
      ),
    );
  }
}
