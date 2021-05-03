import 'package:flutter/material.dart';
import 'package:nyt_news/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).error_loading_data_label,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
