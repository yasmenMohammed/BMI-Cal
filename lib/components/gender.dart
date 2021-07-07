import 'package:bmi_calculator/consts.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  Gender({@required this.genderName, this.genderIcon});

  final IconData genderIcon;
  final String genderName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          genderName,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
