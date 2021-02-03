import 'package:docs/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'util_const.dart';

class Template extends StatelessWidget {
  Widget _body;
  String _title;
  String _subTitle;
  String _titleImage;
  Template(this._body, this._title, this._titleImage, this._subTitle);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: Scaffold(
            backgroundColor: UtilConst().bgColor,
            body: GestureDetector(
              child: Scrollbar(
                isAlwaysShown: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              child: CustomPaint(
                                size: new Size(
                                    UtilConst.width, UtilConst.height * 0.6),
                                painter: HeadDraw(),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: UtilConst.height * 0.5,
                                      width: UtilConst.width * 0.25,
                                      alignment: Alignment.topCenter,
                                      child: imageLoader(this._titleImage),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: UtilConst.height * 0.5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            this._title,
                                            style: TextStyle(
                                                color: UtilConst().bgColor,
                                                fontSize:
                                                    UtilConst.height * 0.03),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        _subTitle.length > 0
                                            ? Container(
                                                child: RotationTransition(
                                                    turns:
                                                        AlwaysStoppedAnimation(
                                                            180 / 360),
                                                    child: Text(
                                                      this._subTitle,
                                                      style: TextStyle(
                                                          color: UtilConst()
                                                              .tpColor,
                                                          fontSize:
                                                              UtilConst.height *
                                                                  0.03),
                                                      textAlign:
                                                          TextAlign.right,
                                                    )),
                                              )
                                            : Container(),
                                      ]),
                                ),
                              ],
                            ),
                            Container(
                              child: CustomPaint(
                                size: new Size(
                                    UtilConst.width, UtilConst.height * 0.6),
                                painter: HeadCoverDraw(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      this._body,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: new Size(
                                UtilConst.width, UtilConst.height * 0.2),
                            painter: BottomDraw(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Powered by Flutter ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: UtilConst.height * 0.02,
                                    child: SvgPicture.asset(
                                        UtilConst().icons("logos_flutter.svg")),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  bool svgChecker(String path) {
    List<String> splitList = path.split(".");
    for (String n in splitList) {
      UtilConst().log(n);
      if (n == "svg") {
        return true;
      }
    }
    return false;
  }

  Widget imageLoader(String path) {
    if (svgChecker(path)) {
      return SvgPicture.asset(path);
    } else {
      UtilConst().log("not svg $path");
      return Image.asset(path);
    }
  }
}

class HeadDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height - size.height / 5);
    path.lineTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = UtilConst().pColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class HeadCoverDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height * 0.4);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    paint.color = UtilConst().bgColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class MenuTitle extends StatelessWidget {
  String _name = "null";

  MenuTitle(this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: UtilConst.height * 0.03,
            child: SvgPicture.asset(
              UtilConst().icons("mdi_marker-check.svg"),
            ),
          ),
          Text(
            this._name,
            style: TextStyle(
                fontSize: UtilConst.height * 0.03, color: UtilConst().pColor),
          ),
          SizedBox(
            height: UtilConst.height * 0.04,
          )
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  Widget _title;
  Widget _body;
  Section(this._title, this._body);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _title,
          _body,
          SizedBox(
            height: UtilConst.height * 0.1,
          )
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            key: null,
            onTap: () {
              launch("https://www.instagram.com/jkaae93/");
            },
            child: Container(
                width: UtilConst.width * 0.05,
                child: SvgPicture.asset(
                    UtilConst().icons("logos_instagram.svg")))),
        InkWell(
            key: null,
            onTap: () {
              launch("https://www.facebook.com/jkaae93/");
            },
            child: Container(
                width: UtilConst.width * 0.05,
                child:
                    SvgPicture.asset(UtilConst().icons("logos_facebook.svg")))),
        InkWell(
            key: null,
            onTap: () {
              launch("https://www.twitter.com/jkaae93/");
            },
            child: Container(
                width: UtilConst.width * 0.05,
                child:
                    SvgPicture.asset(UtilConst().icons("logos_twitter.svg")))),
      ],
    );
  }
}

class BottomDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.moveTo(size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    paint.color = UtilConst().pColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class LangIcon extends StatefulWidget {
  bool levelBubble = false;
  String title = "title";
  Widget image;
  String level = "Lower";

  LangIcon(this.title, this.image, this.level);

  @override
  State<StatefulWidget> createState() =>
      _LangIcon(this.title, this.image, this.level);
}

class _LangIcon extends State<LangIcon> {
  bool levelBubble = false;
  String title = "title";
  Widget image;
  String level = "Lower";

  _LangIcon(this.title, this.image, this.level);

  @override
  void initState() {
    levelBubble = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: UtilConst.width * 0.1,
          child: Column(children: [
            Container(
                height: (UtilConst.height * 0.05),
                child: (this.image == null
                    ? UtilConst().icons("icon_language.svg")
                    : this.image)),
            Container(
              width: UtilConst.width * 0.08,
              alignment: Alignment.center,
              child: Text(this.title,
                  style: TextStyle(fontSize: UtilConst.height * 0.01)),
            ),
            Container(
                height: (UtilConst.height * 0.05),
                child: Visibility(
                  visible: levelBubble,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          UtilConst().icons("bubble.svg"),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            level,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: UtilConst.height * 0.02),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ))
          ])),
      onHover: (isHovering) {
        UtilConst().log("$title onHover in :$isHovering");
        if (isHovering) {
          this.setState(() {
            levelBubble = true;
            UtilConst().log("isHovering is true");
          });
        } else {
          this.setState(() {
            levelBubble = false;
            UtilConst().log("isHovering is false");
          });
        }
      },
      onTap: () {},
    );
  }
}

class CategoryBlock extends StatefulWidget {
  CategoryBlock(this.title, this.bg, this.cb);
  String title;
  Widget bg;
  Function cb;

  @override
  State<StatefulWidget> createState() =>
      _CategoryBlock(this.title, this.bg, this.cb);
}

class _CategoryBlock extends State<CategoryBlock> {
  _CategoryBlock(this.title, this.bg, this.cb);
  String title = "";
  bool hoverState = false;
  Widget bg;
  Function cb;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        this.setState(() {
          hoverState = true;
        });
      },
      onTap: () {
        UtilConst().log("$title, tapped");
        this.cb();
      },
      child: Stack(
        children: [
          Container(
            height: (UtilConst.width * 0.2) * 1.88,
            width: UtilConst.width * 0.2,
            child: this.bg != null
                ? this.bg
                : SvgPicture.asset(UtilConst().images("component1.svg")),
          ),
          Container(
            height: (UtilConst.width * 0.2) * 1.88,
            width: UtilConst.width * 0.2,
            decoration:
                BoxDecoration(color: Color.fromARGB(0x73, 0x00, 0x00, 0x00)),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                this.title,
                style: TextStyle(
                    color: Colors.white, fontSize: UtilConst.height * 0.02),
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    hoverState = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ProjectBanner extends StatefulWidget {
  String title;
  Image bg;
  ProjectBanner(this.title, this.bg);
  @override
  State<StatefulWidget> createState() =>
      _ProjectBannerState(this.title, this.bg);
}

class _ProjectBannerState extends State<ProjectBanner> {
  String title;
  Image bg;
  _ProjectBannerState(this.title, this.bg);
  @override
  Widget build(BuildContext context) {
    UtilConst().log("build $title");
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: UtilConst.width * 0.64,
            height: UtilConst.width * 0.2,
            child: Stack(
              children: [
                Container(
                  child: bg,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(0x73, 0x00, 0x00, 0x00)),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Text(
                      this.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: UtilConst.height * 0.02),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: UtilConst.height * 0.05,
          )
        ],
      ),
    );
  }
}

class ProjectDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectDetail();
}

class _ProjectDetail extends State<ProjectDetail> {
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
    return Scaffold(
      body: Container(),
    );
  }
}
