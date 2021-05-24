import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  ErrorPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        message,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
