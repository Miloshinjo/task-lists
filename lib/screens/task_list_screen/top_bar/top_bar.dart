import 'package:flutter/material.dart';

import '../../../widgets/logo.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
