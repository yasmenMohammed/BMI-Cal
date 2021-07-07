import 'package:flutter/material.dart';
import '../consts.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({this.label, this.pageReturned});
  final pageReturned;
  final label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pageReturned,
      child: Container(
          alignment: Alignment.center,
          color: kButtonColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kButtonHeight,
          child: Text(
            label,
            style: kLargeContainerText,
          )),
    );
  }
}
