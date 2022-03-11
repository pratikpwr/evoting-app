import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-voting',
      home: Scaffold(
        body: Column(

          children: [
            Text('E-voting App'),
            ElevatedButton(onPressed: () {}, child: Text('Register')),
            ElevatedButton(onPressed: () {}, child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
