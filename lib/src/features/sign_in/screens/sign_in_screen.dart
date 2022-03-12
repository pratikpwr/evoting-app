import 'package:evoting/src/core/widgets/atoms/padding_vertical.dart';
import 'package:evoting/src/core/widgets/atoms/snackbar.dart';
import 'package:evoting/src/core/widgets/molecules/button.dart';
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
                  'Please enter your details to Sign In',
                  textAlign: TextAlign.left,
                  style: textTheme.bodyText1,
                ),
                paddingV24,
                TextField(
                  controller: _emailController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                      ),
                      hintText: 'Email',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                paddingV12,
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
                paddingV16,
                EVButton(
                    onTap: () {
                      showSnackBar(context, 'Feature Coming Soon!');
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
