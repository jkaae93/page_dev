import 'package:docs/company_page.dart';
import 'package:docs/main_page.dart';
import 'package:docs/personal_page.dart';
import 'package:docs/univ_page.dart';
import 'package:flutter/material.dart';

import 'util_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      routes: {
        '/': (context) => MainPage(),
        '/univ': (context) => UnivPage(),
        '/comp': (context) => CompanyPage(),
        '/pers': (context) => PersonalPage(),
      },
    );
  }
}

// title

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UtilConst().init(context);
    return MainPage();
  }
}
