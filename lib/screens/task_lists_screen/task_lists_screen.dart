import 'package:flutter/material.dart';

import '../../widgets/logo.dart';
import './draw_horizontal_line.dart';
import './bottom_bar.dart';
import './task_lists.dart';
import './add_list.dart';

class TaskListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[Logo()],
            ),
          ),
          SizedBox(height: 50.0),
          Row(
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
          ),
          SizedBox(height: 30.0),
          AddList(),
          SizedBox(height: 20.0),
          TaskLists(),
        ],
      ),
    );
  }
}
