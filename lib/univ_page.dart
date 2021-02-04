import 'dart:html';

import 'package:docs/template.dart';
import 'package:flutter/material.dart';

import 'util_const.dart';

class UnivPage extends StatefulWidget {
  @override
  _univPageState createState() => _univPageState();
}

class _univPageState extends State<UnivPage> {
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
    UtilConst().init(context);
    UtilConst().log("build univ_page");
    return Template(
        Column(
          children: [
            ProjectBanner("Access Control System",
                Image.asset(UtilConst().images("rfid.png"))),
            ProjectBanner(
                "IoT Clock", Image.asset(UtilConst().images("iot_clock.png"))),
          ],
        ),
        "In University",
        UtilConst().images("component1.png"),
        "");
  }
}
