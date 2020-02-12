import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1A30),
      body: Center(
        child: SvgPicture.asset('assets/svg/logotype.svg'),
      ),
    );
  }
}
