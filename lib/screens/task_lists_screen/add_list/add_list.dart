import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../theme/colors.dart';
import '../../../utils/firestore_utils.dart' as firestore;
import '../../../config/project_limiter.dart' as projectLimiter;

import './validators/add_list.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _listName = '';
  String _error;

  void _validateAndSubmit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      try {
        firestore.addDocument({'listName': _listName});
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
                    stream:
                        Firestore.instance.collection('task-lists').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();

                      final _taskListLength = snapshot.data.documents.length;

                      if (_taskListLength >= projectLimiter.taskListsLimit) {
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
                                'You have reached the maximum limit for making new lists.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
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
                                    setState(() => _listName = value);
                                  },
                                  onFieldSubmitted: (String value) {
                                    setState(() => _listName = value);

                                    _validateAndSubmit();
                                  },
                                  validator: AddListValidator.validate,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  autofocus: true,
                                  cursorColor: listColors[_taskListLength],
                                  decoration: InputDecoration(
                                    errorText: _error,
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: listColors[_taskListLength],
                                          width: 0.0),
                                    ),
                                    labelText: 'List Name',
                                    labelStyle: TextStyle(
                                      color: listColors[_taskListLength],
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
                                      'Add List',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    color: listColors[_taskListLength],
                                    onPressed: _validateAndSubmit,
                                  ),
                                )
                              ],
                            ),
                          ));
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      onTap: _showDialog,
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
              'Add list',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
