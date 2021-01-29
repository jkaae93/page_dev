import 'dart:html';

import 'package:docs/template.dart';
import 'package:docs/util_const.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        Column(
          children: [],
        ),
        "In Company",
        UtilConst().images("component2.png"),
        "");
  }
}
