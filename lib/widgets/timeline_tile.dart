// ignore_for_file: prefer_const_constructors

import 'package:anubandhit/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class TimeLineTileWidget extends StatelessWidget {
  final bool isCheckedValue;
  final bool showStartConnector;
  final bool showEndConnector;
   TimeLineTileWidget({
    super.key,
    required this.isCheckedValue, this.showStartConnector = false,  this.showEndConnector = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      contents: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text('contents'),
        ),
      ),
      nodeAlign: TimelineNodeAlign.start,
      node: TimelineNode(
        indicator: SizedBox(
          height: Dimensions.height18,
          width: Dimensions.height18,
          child: CheckBoxWidget(
            isChecked: isCheckedValue,
          ),
        ),
        //  
        startConnector: showStartConnector ? SizedBox(
            height: Dimensions.height15,
            child: SolidLineConnector(
              color: AppColors.grey,
            )) :null,
            //: SizedBox(),
        endConnector: showEndConnector ? SizedBox(
            height: Dimensions.height15,
            child: SolidLineConnector(
              color: AppColors.grey,
            )) : null,
      ),
    );
  }
}
