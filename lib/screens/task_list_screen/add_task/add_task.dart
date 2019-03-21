import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Color mainColor;

  AddTask(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: mainColor,
        ),
        child: Icon(
          Icons.add,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
