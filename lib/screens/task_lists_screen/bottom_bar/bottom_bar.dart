import 'package:flutter/material.dart';

import '../../../utils/date_utils.dart' as dateUtils;

class BottomBar extends StatelessWidget {
  final String weekDay = dateUtils.getWeekdayFull(DateTime.now());
  final String monthDay = dateUtils.getEnglishDayOfMonth(DateTime.now());
  final String month = dateUtils.getMonthFull(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 32.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
