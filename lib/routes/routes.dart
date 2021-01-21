import 'package:flutter/material.dart';
import 'package:search_app/pages/custom_database.dart';
import 'package:search_app/pages/home_page.dart';
import 'package:search_app/pages/persona/persona_page.dart';
import 'package:search_app/pages/search/filtro_page.dart';
import 'package:search_app/pages/search_page.dart';
import 'package:search_app/pages/work_page.dart';

final Map<String, WidgetBuilder> routes = {
  'HomePage'     : (context) => HomePage(),
  'SearchPage'   : (context) => SearchPage(),
  'WorkPage'     : (context) => WorkPage(),
  'Database'     : (context) => CustomDatabase(),
  'PersonaPage'  : (context) => PersonaPage(),
  'FiltroPage'  : (context) => FiltroPage(),

};