import 'package:flutter/material.dart';

class MaxLimitWarning extends StatelessWidget {
  final String text;

  MaxLimitWarning(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.grey[400],
            size: 30.0,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
