import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: Color(0xFFFFFFFF),
      disabledTextColor: Color(0xFF8E8E93),
      textColor: Color(0xFFFFFFFF),
      color: Color(0xFF007AFF),
      onPressed: _onPressed,
      child: Text('Create account'),
    );
  }
}
