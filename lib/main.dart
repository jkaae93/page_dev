import 'package:docs/company_page.dart';
import 'package:docs/main_page.dart';
import 'package:docs/personal_page.dart';
import 'package:docs/univ_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Serim Portfolio",
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      onGenerateRoute: (route) {
        switch (route.name) {
          case '/':
            MaterialPageRoute(builder: (context) {
              return MainPage();
            });
            break;
          // case '/univ': // TODO: needs checking
          // MaterialPageRoute(builder: (context) {
          // return UnivPage();
          // });
          // break;
          case '/comp':
            MaterialPageRoute(builder: (context) {
              return CompanyPage();
            });
            break;
          case '/pers':
            MaterialPageRoute(builder: (context) {
              return PersonalPage();
            });
            break;
          default:
        }
      },
      routes: {
        // '/': (context) => UnivPage(),
        '/': (context) => MainPage(),
        '/univ': (context) => UnivPage(),
        '/comp': (context) => CompanyPage(),
        '/pers': (context) => PersonalPage(),
      },
    );
  }
}
