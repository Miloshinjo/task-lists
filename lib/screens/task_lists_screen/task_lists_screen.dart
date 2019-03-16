import 'package:flutter/material.dart';

import './draw_horizontal_line.dart';
import './bottom_bar.dart';
import './task_lists.dart';

class TaskListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.widgets,
                  color: Colors.black87,
                  size: 50.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
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
          InkWell(
            splashColor: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              print('Tapped!');
            },
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 15.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Add List',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TaskLists(),
        ],
      ),
    );
  }
}
