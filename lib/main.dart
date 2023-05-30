import 'package:flutter/material.dart';
import 'package:lddm_projects/pages/log_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
