import 'package:evoting/src/features/register/screens/register_screen.dart';
import 'package:evoting/src/features/sign_in/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/atoms/padding_vertical.dart';
import '../../../core/widgets/molecules/icon_button.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'E-VOTE',
                  style: textTheme.headline4,
                ),
                Image.asset(
                  'assets/vote_illu.jpg',
                  height: size.height * 0.4,
                ),
                Text(
                  'Blockchain based Secured E-voting app',
                  style: textTheme.bodyText1,
                ),
                paddingV12,
                IconTextButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return RegisterScreen();
                    }));
                  },
                  text: 'Register',
                  icon: 'assets/registered.png',
                ),
                paddingV12,
                IconTextButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SignInScreen();
                    }));
                  },
                  text: 'Sign In',
                  icon: 'assets/sign-in.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
