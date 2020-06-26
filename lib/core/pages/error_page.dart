import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Error loading articles',
        style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
