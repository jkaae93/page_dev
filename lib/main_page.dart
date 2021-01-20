import 'package:flutter/material.dart';

import 'template.dart';
import 'util_const.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
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
    return Scaffold(
        backgroundColor: UtilConst().bgColor,
        body: Template(
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
                          "Testing Message",
                          style: TextStyle(fontSize: UtilConst.height * 0.02),
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
                              Image.network("./assets/icons/logos_flutter.svg"),
                              "Mid"),
                          LangIcon(
                              "JavaScript",
                              Image.network("./assets/icons/logos_js.svg"),
                              "Lower"),
                          LangIcon(
                              "Kotlin",
                              Image.network("./assets/icons/logos_kotlin.svg"),
                              "Lower"),
                          LangIcon(
                              "C++",
                              Image.network(
                                  "./assets/icons/logos_c-plusplus.svg"),
                              "Mid"),
                          LangIcon(
                              "C",
                              Image.network("./assets/icons/logos_c.svg"),
                              "High"),
                          LangIcon(
                              "Java",
                              Image.network("./assets/icons/logos_java.svg"),
                              "High"),
                          LangIcon(
                              "Android",
                              Image.network("./assets/icons/logos_android.svg"),
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
                            style:
                                TextStyle(fontSize: UtilConst.height * 0.02)),
                        SizedBox(
                          height: UtilConst.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CategoryBlock(
                                "In University",
                                Image.network("./assets/images/component1.svg"),
                                () {}),
                            SizedBox(
                              width: UtilConst.width * 0.04,
                            ),
                            CategoryBlock(
                                "In Company",
                                Image.network("./assets/images/component2.svg"),
                                () {}),
                            SizedBox(
                              width: UtilConst.width * 0.04,
                            ),
                            CategoryBlock(
                                "In Personally",
                                Image.network("./assets/images/component3.svg"),
                                () {}),
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
            "./images/profile.png",
            "안녕하세요. 전세림입니다."));
  }
}
