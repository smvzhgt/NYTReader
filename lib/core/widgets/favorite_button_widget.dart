import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final ArticleEntity entity;
  var isClickable;
  FavoriteButtonWidget({
    Key? key,
    required this.entity,
    this.isClickable = true,
  }) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  _doDbOperations(ArticleEntity entity) {
    if (widget.entity.isFavorite) {
      BlocProvider.of<EmailedBloc>(context)
          .add(DeleteFromFavoriteEvent(widget.entity));
    } else {
      BlocProvider.of<EmailedBloc>(context)
          .add(AddToFavoriteEvent(widget.entity));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isClickable) {
      return IconButton(
        onPressed: () {
          _doDbOperations(widget.entity);

          setState(() {
            widget.entity.isFavorite = !widget.entity.isFavorite;
          });
        },
        icon: widget.entity.isFavorite
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        color: Theme.of(context).indicatorColor,
      );
    } else {
      return Icon(Icons.star, color: Theme.of(context).indicatorColor);
    }
  }
}
