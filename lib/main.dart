import 'package:flutter/material.dart';
import 'package:search_app/routes/routes.dart';
import 'package:search_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'FiltroPage',
      routes: routes,
    );
  }
}
