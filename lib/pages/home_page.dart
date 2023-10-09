// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

//* Day 11 we learned about context, constraints.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Codepur";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text('"Welcome to $days days of flutter by $name.'),
        ),
      ),
      drawer: MyDrawer()
    );
  }
}
