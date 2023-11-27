import 'package:flutter/material.dart';

// ** This is a StatelessView class which is use to link between the View and the controller
//  ** i.e in other for us to truly practice seperation of concern we need to differentitate
// ** our controller from the pure UI code
abstract class StatelessView<T1, T2> extends StatelessWidget {
  final T2 controller;
  T1 get widget => (controller as State).widget as T1;
  const StatelessView(this.controller, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context);
}
