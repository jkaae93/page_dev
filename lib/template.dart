import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'util.dart';

class Template extends StatelessWidget {
  Widget _body;
  String _title;
  String _subTitle;
  String _titleImage;
  Template(this._body, this._title, this._titleImage, this._subTitle);
  @override
  Widget build(BuildContext context) {
    var gestureDetector = GestureDetector(
        child: WillPopScope(
            onWillPop: () async {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              return true;
            },
            child: Scaffold(
                backgroundColor: Util.bgColor,
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
                                    size:
                                        new Size(Util.width, Util.height * 0.4),
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
                                          height: Util.height * 0.4,
                                          width: Util.width * 0.25,
                                          alignment: Alignment.topCenter,
                                          child: imageLoader(this._titleImage),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: Util.height * 0.4,
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
                                                    color: Util.bgColor,
                                                    fontSize:
                                                        Util.height * 0.03),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            subTitleChecker(_subTitle)
                                          ]),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: CustomPaint(
                                    size:
                                        new Size(Util.width, Util.height * 0.4),
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
                                size: new Size(Util.width, Util.height * 0.2),
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
                                        height: Util.height * 0.02,
                                        child: SvgPicture.asset(
                                            Util.icons("logos_flutter.svg")),
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
                ))));
    return gestureDetector;
  }

  bool svgChecker(String path) {
    List<String> splitList = path.split(".");
    for (String n in splitList) {
      Util.log(n);
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
      Util.log("not svg $path");
      return Image.asset(path);
    }
  }

  Widget subTitleChecker(String subTitle) {
    if (subTitle.length > 0) {
      return Container(
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: Text(
                this._subTitle,
                style: TextStyle(
                    color: Util.tpColor, fontSize: Util.height * 0.03),
                textAlign: TextAlign.right,
              )));
    } else {
      return Container();
    }
  }
}

class HeadDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, 0); // left top
    path.lineTo(0, size.height); // left bottom
    path.lineTo(size.width, size.height); // right bottom
    path.lineTo(size.width, 0); // right top
    path.close();

    paint.color = Util.pColor;
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
    path.moveTo(size.width, size.height); // right top
    path.lineTo(0, size.height * 0.7); // left top
    path.lineTo(0, size.height); // left bottom
    path.lineTo(size.width, size.height); // right bottom
    path.close();

    paint.color = Util.bgColor;
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
            height: Util.height * 0.03,
            child: SvgPicture.asset(
              Util.icons("mdi_marker-check.svg"),
            ),
          ),
          Text(
            this._name,
            style: TextStyle(fontSize: Util.height * 0.03, color: Util.pColor),
          ),
          SizedBox(
            height: Util.height * 0.04,
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
            height: Util.height * 0.05,
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
                width: Util.width * 0.05,
                child: SvgPicture.asset(Util.icons("logos_instagram.svg")))),
        InkWell(
            key: null,
            onTap: () {
              launch("https://www.facebook.com/jkaae93/");
            },
            child: Container(
                width: Util.width * 0.05,
                child: SvgPicture.asset(Util.icons("logos_facebook.svg")))),
        InkWell(
            key: null,
            onTap: () {
              launch("https://www.twitter.com/jkaae93/");
            },
            child: Container(
                width: Util.width * 0.05,
                child: SvgPicture.asset(Util.icons("logos_twitter.svg")))),
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

    paint.color = Util.pColor;
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
          width: Util.width * 0.1,
          child: Column(children: [
            Container(
                height: (Util.height * 0.05),
                child: (this.image == null
                    ? Util.icons("icon_language.svg")
                    : this.image)),
            Container(
              width: Util.width * 0.08,
              alignment: Alignment.center,
              child: Text(this.title,
                  style: TextStyle(fontSize: Util.height * 0.01)),
            ),
            Container(
                height: (Util.height * 0.05),
                child: Visibility(
                  visible: levelBubble,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Util.icons("bubble.svg"),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            level,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Util.height * 0.02),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ))
          ])),
      onHover: (isHovering) {
        Util.log("$title onHover in :$isHovering");
        if (isHovering) {
          this.setState(() {
            levelBubble = true;
            Util.log("isHovering is true");
          });
        } else {
          this.setState(() {
            levelBubble = false;
            Util.log("isHovering is false");
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
        Util.log("$title, tapped");
        this.cb();
      },
      child: Stack(
        children: [
          Container(
            height: (Util.width * 0.2) * 1.88,
            width: Util.width * 0.2,
            child: this.bg != null
                ? this.bg
                : SvgPicture.asset(Util.images("component1.svg")),
          ),
          Container(
            height: (Util.width * 0.2) * 1.88,
            width: Util.width * 0.2,
            decoration:
                BoxDecoration(color: Color.fromARGB(0x73, 0x00, 0x00, 0x00)),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                this.title,
                style: TextStyle(
                    color: Colors.white, fontSize: Util.height * 0.02),
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
  String link;
  ProjectBanner(this.title, this.bg, this.link);
  @override
  State<StatefulWidget> createState() =>
      _ProjectBannerState(this.title, this.bg, this.link);
}

class _ProjectBannerState extends State<ProjectBanner> {
  String title;
  Image bg;
  String link;
  _ProjectBannerState(this.title, this.bg, this.link);
  @override
  Widget build(BuildContext context) {
    Util.log("build $title");
    return InkWell(
      onTap: () {
        _launchURL(link);
      },
      child: Column(
        children: [
          Container(
            width: Util.width * 0.64,
            height: Util.width * 0.2,
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
                          color: Colors.white, fontSize: Util.height * 0.02),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: Util.height * 0.05,
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
