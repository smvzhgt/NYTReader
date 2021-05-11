import 'package:flutter/material.dart';
import 'package:nyt_news/generated/l10n.dart';

class EmptyFavoritePage extends StatelessWidget {
  const EmptyFavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).empty_favorite_label,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
