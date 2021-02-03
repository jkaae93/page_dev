import 'dart:html';

import 'package:docs/template.dart';
import 'package:docs/util_const.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
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
          children: [
            ProjectBanner(
                "This web", Image.asset(UtilConst().images("this.png"))),
            ProjectBanner("A part of Animal Health Care Platform",
                Image.asset(UtilConst().images("pet.png"))),
            SizedBox(
              width: UtilConst.width * 0.64,
              height: UtilConst.width * 0.2,
            ),
          ],
        ),
        "In Personally",
        UtilConst().images("component3.png"),
        "");
  }
}
