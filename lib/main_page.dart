import 'package:docs/univ_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'template.dart';
import 'util_const.dart';

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
    UtilConst().init(context);
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
                  color: UtilConst().bgColor,
                ),
                child: Section(
                    MenuTitle("About me"),
                    Container(
                      child: Text(
                        "배재대학교 컴퓨터공학과를 나왔고, 진심으로 도움이 되는 IoT를 하고 싶습니다. \n 제 인생을 말하는 노래가 있다면 그건 분명 랄라스윗의 '벨이 울리면'이겠지요.",
                        style: TextStyle(
                            fontSize: UtilConst.height * 0.02,
                            fontFamily: 'CuteFont'),
                      ),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: UtilConst().bgColor,
                ),
                child: Section(
                    MenuTitle("Skills"),
                    Container(
                        child: Container(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: (UtilConst.width * 0.1),
                        ),
                        LangIcon(
                            "Flutter",
                            SvgPicture.asset(
                                UtilConst().icons("logos_flutter.svg")),
                            "Mid"),
                        LangIcon(
                            "JavaScript",
                            SvgPicture.asset(UtilConst().icons("logos_js.svg")),
                            "Lower"),
                        LangIcon(
                            "Kotlin",
                            SvgPicture.asset(
                                UtilConst().icons("logos_kotlin.svg")),
                            "Lower"),
                        LangIcon(
                            "C++",
                            SvgPicture.asset(
                                UtilConst().icons("logos_c-plusplus.svg")),
                            "Mid"),
                        LangIcon(
                            "C",
                            SvgPicture.asset(UtilConst().icons("logos_c.svg")),
                            "High"),
                        LangIcon(
                            "Java",
                            SvgPicture.asset(
                                UtilConst().icons("logos_java.svg")),
                            "High"),
                        LangIcon(
                            "Android",
                            SvgPicture.asset(
                                UtilConst().icons("logos_android.svg")),
                            "Mid"),
                        Container(
                          width: (UtilConst.width * 0.1),
                        ),
                      ],
                    )))),
              ),
              Container(
                decoration: BoxDecoration(
                  color: UtilConst().bgColor,
                ),
                child: Section(
                  MenuTitle("Projects"),
                  Column(
                    children: [
                      Text(
                          "Every project is precious to me. Even if it was a really small project.",
                          style: TextStyle(fontSize: UtilConst.height * 0.02)),
                      SizedBox(
                        height: UtilConst.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CategoryBlock("In University",
                              Image.asset(UtilConst().images("component1.png")),
                              () {
                            Navigator.pushNamed(context, UtilConst.univRoute);
                          }),
                          SizedBox(
                            width: UtilConst.width * 0.04,
                          ),
                          CategoryBlock("In Company",
                              Image.asset(UtilConst().images("component2.png")),
                              () {
                            Navigator.pushNamed(context, UtilConst.compRoute);
                          }),
                          SizedBox(
                            width: UtilConst.width * 0.04,
                          ),
                          CategoryBlock("In Personally",
                              Image.asset(UtilConst().images("component3.png")),
                              () {
                            Navigator.pushNamed(context, UtilConst.persRoute);
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
                      "More than",
                      style: TextStyle(fontSize: UtilConst.height * 0.017),
                    ),
                    SizedBox(
                      height: UtilConst.height * 0.025,
                    ),
                    Container(
                      height: UtilConst.height * 0.03,
                      child: SocialButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          "Hello, I'm Serim",
          UtilConst().images("profile.jpg"),
          // "안녕하세요. 전세림입니다."
          "",
        ));
  }
}
