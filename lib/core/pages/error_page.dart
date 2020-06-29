import 'package:flutter/material.dart';
import 'package:nyt_news/core/constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        ERROR_LOADING_DATA_LABEL,
        style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
