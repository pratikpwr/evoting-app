import 'package:evoting/src/core/widgets/atoms/padding_vertical.dart';
import 'package:evoting/src/core/widgets/molecules/button.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/atoms/snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _aadharDateController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

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
                  'Please enter your details to Register',
                  textAlign: TextAlign.left,
                  style: textTheme.bodyText1,
                ),
                paddingV24,
                TextField(
                  controller: _userNameController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_rounded,
                      ),
                      hintText: 'Full Name',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                paddingV12,
                TextField(
                  controller: _birthDateController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.calendar_today_rounded,
                      ),
                      hintText: 'Date Of Birth',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                paddingV12,
                TextField(
                  controller: _aadharDateController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.document_scanner_rounded,
                      ),
                      hintText: 'Voter ID',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                paddingV12,
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
                TextField(
                  controller: _confirmPassController,
                  style: textTheme.subtitle2,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: textTheme.subtitle2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                paddingV16,
                EVButton(
                    onTap: () {
                      showSnackBar(context, 'Feature Coming Soon!');
                    },
                    text: 'Register'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
