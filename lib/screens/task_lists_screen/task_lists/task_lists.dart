import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import './task_list_card/task_list_card.dart';
import '../../../theme/colors.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection('task-lists').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  List<dynamic> taskListCards =
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    final String listName = document.data['listName'];
                    final List<dynamic> tasks = document.data['tasks'] ?? [];
                    final String id = document.documentID;

                    return TaskListCard(id, listName, listColors[index], tasks);
                  }).toList();

                  return taskListCards[index];
                });
          },
        ),
      ),
    );
  }
}
