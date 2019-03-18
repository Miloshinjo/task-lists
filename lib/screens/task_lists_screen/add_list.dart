import 'package:flutter/material.dart';

import '../../theme/colors.dart';

import '../../utils/firestore_utils.dart' as firestore;

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  String _listName = '';
  String _error;

  void _onSubmitted(String value) async {
    setState(() {
      _listName = value;
    });

    try {
      firestore.addDocument('task-lists', {'listName': _listName});
    } catch (e) {
      print(e);
    }

    Navigator.pop(context);
  }

  void _onChanged(String value) => setState(() => _listName = value);

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Container(),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          onSubmitted: _onSubmitted,
                          onChanged: _onChanged,
                          cursorColor: purple,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: purple, width: 0.0),
                            ),
                            labelText: 'List Name',
                            labelStyle: TextStyle(color: purple),
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
                            color: purple,
                            onPressed: () => _onSubmitted(_listName),
                          ),
                        )
                      ],
                    ))
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
