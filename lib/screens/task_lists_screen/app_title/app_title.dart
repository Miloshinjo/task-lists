import 'package:flutter/material.dart';

import './draw_horizontal_line.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomPaint(painter: DrawHorizontalLine(false)),
        RichText(
          text: TextSpan(
              text: 'Task ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
                fontFamily: 'Poppins',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Lists',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                )
              ]),
        ),
        CustomPaint(painter: DrawHorizontalLine(true)),
      ],
    );
  }
}
