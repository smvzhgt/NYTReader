import 'package:flutter/material.dart';
import 'package:nyt_news/core/entities/article_entity.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final ArticleEntity entity;
  final Function(ArticleEntity entity) onClickButton;

  FavoriteButtonWidget({
    Key? key,
    required this.entity,
    required this.onClickButton,
  }) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onClickButton(widget.entity);
        setState(() {
          widget.entity.isFavorite = !widget.entity.isFavorite;
        });
      },
      icon:
          widget.entity.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
      color: Theme.of(context).indicatorColor,
    );
  }
}
