import 'package:evoting/src/core/themes/text_theme.dart';
import 'package:evoting/src/features/sign_in/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-voting',
        theme: ThemeData(
          textTheme: textTheme,
        ),
        home: SignInScreen());
  }
}
