import 'package:evoting/src/core/widgets/atoms/padding.dart';
import 'package:evoting/src/core/widgets/molecules/button.dart';
import 'package:evoting/src/features/vote/screens/voting_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.all(16),
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
                padding12,
                Text(
                  'Please enter your details to Sign In',
                  textAlign: TextAlign.left,
                  style: textTheme.bodyText1,
                ),
                padding24,
                TextField(
                  controller: _emailController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                      ),
                      hintText: 'Mobile No.',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                padding12,
                TextField(
                  controller: _passwordController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                      ),
                      hintText: 'Password',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                padding16,
                EVButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VotingScreen();
                      }));
                    },
                    text: 'SIGN IN'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
