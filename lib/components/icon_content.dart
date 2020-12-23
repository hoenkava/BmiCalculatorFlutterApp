import 'package:flutter/material.dart';
import '../constants.dart';

const iconSize = 80.0;
const heightOfTheBox = 15.0;

class IconsReuse extends StatelessWidget {
  IconsReuse({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: heightOfTheBox,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
