import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  child: CustomPaint(
                    size: new Size(UtilConst.width, UtilConst.height * 0.6),
                    painter: HeadDraw(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: UtilConst.height * 0.5,
                      child: Image(image: AssetImage(this._titleImage)),
                    ),
                    Container(
                      height: UtilConst.height * 0.5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                this._title,
                                style: TextStyle(
                                    color: UtilConst().bgColor,
                                    fontSize: UtilConst.height * 0.03),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            _subTitle.length > 0
                                ? Container(
                                    child: RotationTransition(
                                        turns:
                                            AlwaysStoppedAnimation(180 / 360),
                                        child: Text(
                                          this._subTitle,
                                          style: TextStyle(
                                              color: UtilConst().tpColor,
                                              fontSize:
                                                  UtilConst.height * 0.03),
                                          textAlign: TextAlign.right,
                                        )),
                                  )
                                : Container(),
                          ]),
                    ),
                  ],
                ),
                Container(
                  child: CustomPaint(
                    size: new Size(UtilConst.width, UtilConst.height * 0.6),
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
                size: new Size(UtilConst.width, UtilConst.height * 0.2),
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
                        child: Image.network("assets/icons/logos_flutter.svg"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeadDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height - size.height / 5);
    path.lineTo(0, size.height * 0.5);
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
    path.lineTo(0, size.height * 0.5);
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
            child: Image.network(
              "assets/icons/mdi_marker-check.svg",
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
        FlatButton(
          key: null,
          onPressed: () {
            launch("https://www.instagram.com/jkaae93/");
          },
          child: Image.network("assets/icons/logos_instagram.svg"),
        ),
        FlatButton(
            key: null,
            onPressed: () {
              launch("https://www.facebook.com/jkaae93/");
            },
            child: Image.network("assets/icons/logos_facebook.svg")),
        FlatButton(
            key: null,
            onPressed: () {
              launch("https://www.twitter.com/jkaae93/");
            },
            child: Image.network("assets/icons/logos_twitter.svg")),
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
  Image image;
  String level = "Lower";

  LangIcon(this.title, this.image, this.level);

  @override
  State<StatefulWidget> createState() =>
      _LangIcon(this.title, this.image, this.level);
}

class _LangIcon extends State<LangIcon> {
  bool levelBubble = false;
  String title = "title";
  Image image;
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
                    ? "./assets/icons/icon_language.svg"
                    : this.image)),
            Container(
                child: Text(this.title,
                    style: TextStyle(fontSize: UtilConst.height * 0.01))),
            Container(
                height: (UtilConst.height * 0.05),
                child: Visibility(
                  visible: levelBubble,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          "./assets/icons/bubble.svg",
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
        print("$title onHover in :$isHovering");
        if (isHovering) {
          this.setState(() {
            levelBubble = true;
            print("isHovering is true");
          });
        } else {
          this.setState(() {
            levelBubble = false;
            print("isHovering is false");
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
  Image bg;
  Function cb;

  @override
  State<StatefulWidget> createState() =>
      _CategoryBlock(this.title, this.bg, this.cb);
}

class _CategoryBlock extends State<CategoryBlock> {
  _CategoryBlock(this.title, this.bg, this.cb);
  String title = "";
  bool hoverState = false;
  Image bg;
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
        print("$title, tapped");
        this.cb();
      },
      child: Stack(
        children: [
          Container(
            height: (UtilConst.width * 0.2) * 1.88,
            width: UtilConst.width * 0.2,
            child: this.bg != null
                ? this.bg
                : Image.network("./assets/images/component1.svg"),
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
