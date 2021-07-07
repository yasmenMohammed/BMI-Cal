import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  Reusable({@required this.colorCard, this.cardChild, this.onPressed});
  final colorCard;
  final cardChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colorCard,
        ),
      ),
    );
  }
}
