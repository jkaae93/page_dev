import 'package:docs/main_page.dart';
import 'package:docs/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: Home(),
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
