import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 10.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
