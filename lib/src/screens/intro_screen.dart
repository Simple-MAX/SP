import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharpnote/src/login/login_screen.dart';
import 'package:sharpnote/src/user_repository.dart';
import 'package:sharpnote/src/login/login_form.dart';

class IntroScreen extends StatelessWidget {
  final UserRepository _userRepository;

  IntroScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 100);

  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1A30),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                child: Stack(
                  children: <Widget>[
                    PageView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Magically turn voice into\nsearchable, shareable notes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Record your meeting, lecture or conversation and\nget the notes automatically on your device ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              SvgPicture.asset(
                                'assets/svg/splash (1).svg',
                                height: 100.0,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'All of your conversations are\nsecure in Sharpnote',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Keep your meeting, interviews, journals, and\nvoice memos organized in one safe place',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              SvgPicture.asset(
                                'assets/svg/splash (2).svg',
                                height: 100.0,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Sharpnote improve\nitself and you',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Everybody take notes in different ways, we use AI to\nensure that you get the notes in your way.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 24.0,
                              ),
                              SvgPicture.asset(
                                'assets/svg/splash (3).svg',
                                height: 100.0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    new Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: new Container(
                        //color: Colors.grey[800].withOpacity(0.5),
                        padding: const EdgeInsets.only(top: 70, bottom: 0),
                        child: new Center(
                          child: new DotsIndicator(
                            controller: _controller,
                            itemCount: 3,
                            onPageSelected: (int page) {
                              _controller.animateToPage(
                                page,
                                duration: _kDuration,
                                curve: _kCurve,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                //height: MediaQuery.of(context).size.height / 3.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Log in or sign up for free',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white54,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                    userRepository: _userRepository,
                                  )),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                          color: Color(0xFF007AFF),
                          textColor: Colors.white,
                          child: Text(
                            'Continue with email',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginForm()));
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomPaint(
                            painter: Drawhorizontalline(false),
                          ),
                          Text(
                            'OR',
                            style: TextStyle(color: Colors.white),
                          ),
                          CustomPaint(
                            painter: Drawhorizontalline(true),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFF007AFF)),
                              textColor: Colors.white,
                              child: Text(
                                'Google',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF007AFF),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.white),
                              textColor: Colors.white,
                              child: Text(
                                'Apple',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!reverse) {
      canvas.drawLine(Offset(30.0, 0.0), Offset(190.0, 0.0), _paint);
    } else {
      canvas.drawLine(Offset(-190.0, 0.0), Offset(-30.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 6.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 15.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
