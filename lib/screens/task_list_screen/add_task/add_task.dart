import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/firestore_utils.dart' as firestore;
import '../../../config/project_limiter.dart' as projectLimiter;
import './validators/add_task.dart';
import '../../../widgets/max_limit_warning.dart';

class AddTask extends StatefulWidget {
  final String listId;
  final Color mainColor;

  AddTask(this.listId, this.mainColor);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _taskBody;
  String _error;

  void _validateAndSubmit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      try {
        Map<String, dynamic> task = {
          'id': Uuid().v4(),
          'completed': false,
          'body': _taskBody,
        };
        firestore.updateTaskDocument(widget.listId, task);
        setState(() => _error = null);
        Navigator.pop(context);
      } catch (e) {
        print(e);
        setState(() => _error = '❌ There was an error. Sorry 😢');
      }
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: null,
              children: <Widget>[
                StreamBuilder<Object>(
                    stream: Firestore.instance
                        .collection('task-lists')
                        .document(widget.listId)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();

                      final _tasksLength = snapshot.data['tasks'].length;

                      if (_tasksLength >= projectLimiter.tasksLimit) {
                        return MaxLimitWarning(
                          'You have reached the maximum limit for making tasks. Complete some tasks before making new ones.',
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                onSaved: (String value) {
                                  setState(() => _taskBody = value);
                                },
                                onFieldSubmitted: (String value) {
                                  setState(() => _taskBody = value);

                                  _validateAndSubmit();
                                },
                                validator: AddTaskValidator.validate,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                autofocus: true,
                                cursorColor: widget.mainColor,
                                decoration: InputDecoration(
                                  errorText: _error,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: widget.mainColor,
                                      width: 0.0,
                                    ),
                                  ),
                                  labelText: 'Task Name',
                                  labelStyle: TextStyle(
                                    color: widget.mainColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  child: Text(
                                    'Add Task',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  color: widget.mainColor,
                                  onPressed: _validateAndSubmit,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDialog,
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: widget.mainColor,
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
