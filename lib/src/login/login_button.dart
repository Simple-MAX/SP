import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: Color(0xFFFFFFFF),
      disabledTextColor: Color(0xFF8E8E93),
      color: Color(0xFF007AFF),
      onPressed: _onPressed,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
