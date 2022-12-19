import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({
    required this.isChecked,
    super.key,
  });
  bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.all(Color(0xFF029B02)),
      value: isChecked,
      shape: CircleBorder(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (bool? value) {
        isChecked = value!;
        (context as Element).markNeedsBuild();
      },
    );
  }
}
