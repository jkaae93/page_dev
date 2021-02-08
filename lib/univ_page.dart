import 'dart:html';

import 'package:docs/template.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'util.dart';

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
    Util().init(context);
    Util.log("build univ_page");
    return Template(
        Column(
          children: [
            ProjectBanner('univ.acs'.tr(), Image.asset(Util.images("rfid.png")),
                'link.univ.acs'.tr()),
            ProjectBanner(
                'univ.iot'.tr(),
                Image.asset(Util.images("iot_clock.png")),
                'link.univ.iot'.tr()),
          ],
        ),
        'univ.in_univ'.tr(),
        Util.images("component1.png"),
        "");
  }
}
