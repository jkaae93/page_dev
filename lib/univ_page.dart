import 'dart:html';

import 'package:docs/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
    var image = Image.asset(UtilConst().images("smart_home.png"));
    // UtilConst().log("build univ_page");
    return Template(
        Column(
          children: [
            ProjectBanner("Smart Home",
                Image(image: Svg(UtilConst().icons("logos_kotlin.svg")))),
          ],
        ),
        "In University",
        UtilConst().images("component1.png"),
        "");
  }
}
