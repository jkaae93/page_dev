import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'util_const.dart';

class Template extends StatelessWidget {
  Widget _body = null;
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
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  size: new Size(UtilConst.width, UtilConst.height * 0.2),
                  painter: BottomDraw(),
                ),
                Container(
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
                )
              ],
            ),
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
            height: UtilConst.height * 0.02,
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
        SizedBox(
            // width: UtilConst.width * 0.00,
            ),
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
