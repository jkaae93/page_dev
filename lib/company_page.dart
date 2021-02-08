import 'dart:html';

import 'package:docs/template.dart';
import 'package:docs/util.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
          children: [
            ProjectBanner(
                'comp.firm'.tr(),
                Image.asset(Util.images("firmware.png")),
                'link.comp.firm'.tr()),
            ProjectBanner('comp.and'.tr(),
                Image.asset(Util.images("android.png")), 'link.comp.and'.tr()),
            ProjectBanner('comp.pet'.tr(), Image.asset(Util.images("pet.png")),
                'link.comp.pet'.tr()),
            SizedBox(
              width: Util.width * 0.64,
              height: Util.width * 0.2,
            ),
          ],
        ),
        'comp.in_comp'.tr(),
        Util.images("component2.png"),
        "");
  }
}
