import 'package:docs/univ_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

import 'template.dart';
import 'util.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool jsBubble = false;
  @override
  void initState() {
    jsBubble = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Util().init(context);
    return InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(100),
        minScale: 1,
        maxScale: 1,
        child: Template(
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Util.bgColor,
                ),
                child: Section(
                    MenuTitle('about'.tr()),
                    Container(
                      child: Text(
                        'about_msg'.tr(),
                        style: TextStyle(
                            fontSize: Util.height * 0.02,
                            fontFamily: 'CuteFont'),
                      ),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Util.bgColor,
                ),
                child: Section(
                    MenuTitle('skills'.tr()),
                    Container(
                        child: Container(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: (Util.width * 0.1),
                        ),
                        LangIcon(
                            'flutter'.tr(),
                            SvgPicture.asset(Util.icons("logos_flutter.svg")),
                            'mid'.tr()),
                        LangIcon(
                            'js'.tr(),
                            SvgPicture.asset(Util.icons("logos_js.svg")),
                            'low'.tr()),
                        LangIcon(
                            'kotlin'.tr(),
                            SvgPicture.asset(Util.icons("logos_kotlin.svg")),
                            'low'.tr()),
                        LangIcon(
                            'cpp'.tr(),
                            SvgPicture.asset(
                                Util.icons("logos_c-plusplus.svg")),
                            'mid'.tr()),
                        LangIcon(
                            'c'.tr(),
                            SvgPicture.asset(Util.icons("logos_c.svg")),
                            'high'.tr()),
                        LangIcon(
                            'java'.tr(),
                            SvgPicture.asset(Util.icons("logos_java.svg")),
                            'high'.tr()),
                        LangIcon(
                            'and'.tr(),
                            SvgPicture.asset(Util.icons("logos_android.svg")),
                            'mid'.tr()),
                        Container(
                          width: (Util.width * 0.1),
                        ),
                      ],
                    )))),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Util.bgColor,
                ),
                child: Section(
                  MenuTitle('project'.tr()),
                  Column(
                    children: [
                      Text('project.sub'.tr(),
                          style: TextStyle(fontSize: Util.height * 0.02)),
                      SizedBox(
                        height: Util.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CategoryBlock('univ.in_univ'.tr(),
                              Image.asset(Util.images("component1.png")), () {
                            Navigator.pushNamed(context, Util.univRoute);
                          }),
                          SizedBox(
                            width: Util.width * 0.04,
                          ),
                          CategoryBlock('comp.in_comp'.tr(),
                              Image.asset(Util.images("component2.png")), () {
                            Navigator.pushNamed(context, Util.compRoute);
                          }),
                          SizedBox(
                            width: Util.width * 0.04,
                          ),
                          CategoryBlock('pers.in_pers'.tr(),
                              Image.asset(Util.images("component3.png")), () {
                            Navigator.pushNamed(context, Util.persRoute);
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'more'.tr(),
                      style: TextStyle(fontSize: Util.height * 0.017),
                    ),
                    SizedBox(
                      height: Util.height * 0.025,
                    ),
                    Container(
                      height: Util.height * 0.03,
                      child: SocialButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          'hello'.tr(),
          Util.images("profile.jpg"),
          // "안녕하세요. 전세림입니다."
          "",
        ));
  }
}
