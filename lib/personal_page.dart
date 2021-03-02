import 'dart:html';

import 'package:docs/template.dart';
import 'package:docs/util.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
                'pers.this'.tr(), Image.asset(Util.images("this.png")), ''),
            SizedBox(
              width: Util.width * 0.64,
              height: Util.width * 0.2,
            ),
          ],
        ),
        'pers.in_pers'.tr(),
        Util.images("component3.png"),
        "");
  }
}
