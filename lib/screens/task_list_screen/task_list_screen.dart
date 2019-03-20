import 'package:flutter/material.dart';

import '../../widgets/logo.dart';

class TaskListScreen extends StatelessWidget {
  final String listId;
  final Color mainColor;

  TaskListScreen(this.listId, this.mainColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails dragDetails) {
        if (dragDetails.primaryVelocity > 3000) Navigator.pop(context);
      },
      child: Hero(
        tag: listId,
        child: Scaffold(
          floatingActionButton: InkWell(
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
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Logo(),
                    IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 32.0,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.only(left: 21.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 30.0, right: 25.0, bottom: 30.0),
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                        value: 2 / 7,
                        strokeWidth: 3.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 30.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'My Tasks',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '2 of 7 tasks',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
