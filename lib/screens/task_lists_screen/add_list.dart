import 'package:flutter/material.dart';

import '../../utils/firestore_utils.dart' as firestore;

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  String _listName = '';

  void _onSubmitted(String value) {
    setState(() {
      _listName = value;
    });

    Navigator.pop(context);
  }

  void _onChanged(String value) => setState(() => _listName = value);

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text('Give your list a name'),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          onSubmitted: _onSubmitted,
                          onChanged: _onChanged,
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
                            color: Theme.of(context).primaryColor,
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
    );
  }
}
