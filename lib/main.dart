import 'package:docs/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'util_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      home: Title(),
    );
  }
}

// title

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UtilConst().init(context);
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
                  child: Section(MenuTitle("Skills"),
                      Container(child: Text("testing message"))),
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
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    child: Image.network(
                                        "./assets/images/component1.svg"),
                                    // child: SvgPicture.asset(
                                    //     "assets/images/component2.svg"),
                                  ),
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                            0x73, 0x00, 0x00, 0x00)),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Text(
                                        "In University",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: UtilConst.width * 0.04,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    child: Image.network(
                                        "./assets/images/component2.svg"),
                                  ),
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                            0x73, 0x00, 0x00, 0x00)),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Text(
                                        "In Company",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: UtilConst.width * 0.04,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    child: Image.network(
                                        "./assets/images/component3.svg"),
                                  ),
                                  Container(
                                    height: (UtilConst.width * 0.2) * 1.88,
                                    width: UtilConst.width * 0.2,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                            0x73, 0x00, 0x00, 0x00)),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Text(
                                        "In Personally",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
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
            "images/profile.png",
            "안녕하세요. 전세림입니다."));
  }
}

// about me
// skills
// projects
// more than
// bottom banner
