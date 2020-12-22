//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(
                Icons.food_bank,
                size: 20,
              ),
              title: Text(
                "Meals",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 20,
            ),
            title: Text(
              "Filters",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
