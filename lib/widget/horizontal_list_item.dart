import 'package:flutter/material.dart';
import 'package:myapp/config/my_colors.dart';

Widget getHorizontalListItem() {
  return Container(
    width: 250,
    child: Card(
        color: Colors.green[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/clean.png',
              height: 120,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cleaning Service',
              style: TextStyle(
                  color: MyColors.colorPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        )),
  );
}
