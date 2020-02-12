import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharpnote/src/user_repository.dart';
import 'package:sharpnote/src/bloc/bloc.dart';
import 'package:sharpnote/bloc_delegate.dart';
import 'package:sharpnote/src/screens/splash_screen.dart';
import 'package:sharpnote/src/screens/home_screen.dart';
import 'package:sharpnote/src/login/login_screen.dart';
import 'package:sharpnote/src/widgets/intro_slider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // set status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarBrightness: Brightness.dark));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //SystemChannels.textInput.invokeMethod('TextInput.hide');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
            //return IntroScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
        },
      ),
    );
  }
}
