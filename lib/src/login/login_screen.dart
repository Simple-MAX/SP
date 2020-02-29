import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharpnote/src/user_repository.dart';
import 'package:sharpnote/src/login/bloc/bloc.dart';
import 'package:sharpnote/src/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1A30),
      appBar: AppBar(
        backgroundColor: Color(0xff1D1A30),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: _userRepository),
          child: LoginForm(userRepository: _userRepository),
        ),
      ),
    );
  }
}
