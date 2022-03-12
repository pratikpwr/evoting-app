import 'package:evoting/src/core/themes/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(
        message,
        style:
            Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
      )));
}
