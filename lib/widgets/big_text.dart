import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {

   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  int? maxLines;

  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.size = 0,
    this.maxLines=1,
    this.overflow = TextOverflow.ellipsis}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      softWrap: true,
      maxLines: maxLines,
      overflow: maxLines==null? null: overflow,
      style: TextStyle(
        fontFamily: 'RedHat',
        color: color,
        fontSize: size ==0 ? Dimensions.font20 : size,
        fontWeight: fontWeight == FontWeight.normal ? FontWeight.w400 : fontWeight,
      ),
    );
  }
}
