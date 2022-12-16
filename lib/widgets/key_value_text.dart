// ignore_for_file: must_be_immutable

import 'package:anubandhit/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class KeyValueText extends StatelessWidget {
  KeyValueText({
    super.key,
    required this.icon,
    required this.keyText,
    required this.value,
  });
  IconData icon;
  String keyText;
  String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.orange,
            ),
            SmallText(
              text: keyText,
              color: AppColors.orange,
              size: Dimensions.font20 * .7,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Expanded(
            child: SizedBox(
                child: BigText(
                    text: value, maxLines: null, size: Dimensions.font20 * .7)))
      ],
    );
  }
}
