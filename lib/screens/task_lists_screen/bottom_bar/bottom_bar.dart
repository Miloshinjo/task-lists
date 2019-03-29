import 'package:flutter/material.dart';

import '../../../utils/date_utils.dart' as dateUtils;

class BottomBar extends StatelessWidget {
  final String weekDay = dateUtils.getWeekdayFull(DateTime.now());
  final String monthDay = dateUtils.getEnglishDayOfMonth(DateTime.now());
  final String month = dateUtils.getMonthFull(DateTime.now());

  @override
  Widget build(BuildContext context) {
    const List<String> settingsOptions = <String>['About', 'Help', 'Logout'];

    void _optionsAction(String option) {
      if (option == 'About') {
        print('About');
      } else if (option == 'Subscribe') {
        print('Subscribe');
      } else if (option == 'Logout') {
        print('Logout');
      }
    }

    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: '$weekDay, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: '$monthDay $month',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ]),
            ),
            Spacer(),
            PopupMenuButton<String>(
              onSelected: _optionsAction,
              itemBuilder: (BuildContext context) {
                return settingsOptions.map((String option) {
                  return PopupMenuItem<String>(
                    child: Text(option),
                    value: option,
                  );
                }).toList();
              },
            )
          ],
        ),
      ),
    );
  }
}
