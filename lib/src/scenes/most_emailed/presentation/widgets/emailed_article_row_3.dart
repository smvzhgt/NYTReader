import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailedArticleRow3 extends StatefulWidget {
  final ArticleEntity entity;
  EmailedArticleRow3({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  _EmailedArticleRowState createState() => _EmailedArticleRowState();
}

class _EmailedArticleRowState extends State<EmailedArticleRow3> {
  bool _isFavorite = true;
  final _imageSize = 0.17;
  final _buttonContainerSize = 30.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heightImage = width * 0.2;

    void _onClickRow(ArticleEntity entity) async {
      if (entity.url.isNotEmpty) {
        final url = entity.url;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    }

    Widget _imageContainer(String? url, double height) {
      if (url == null || url.isEmpty) {
        return Container(
          height: height * _imageSize,
          width: height * _imageSize,
          child: Image.asset(kNoImagePlaceholder),
        );
      } else {
        return Container(
          height: height * _imageSize,
          width: height * _imageSize,
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
            height: height * _imageSize,
            width: height * _imageSize,
          ),
        );
      }
    }

    Widget _titleContainer(ArticleEntity entity) {
      return Text(
        entity.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      );
    }

    Widget _contantContainer(ArticleEntity entity) {
      return Expanded(
        child: Container(
          child: Text(
            entity.articleAbstract,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    Widget _buttonContainer(BuildContext context) {
      return Container(
        height: _buttonContainerSize,
        width: _buttonContainerSize,
        child: Visibility(
          child: Icon(
            Icons.star_border,
            size: _buttonContainerSize,
            color: Theme.of(context).indicatorColor,
          ),
          visible: _isFavorite,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _onClickRow(widget.entity);
      },
      child: Container(
        height: heightImage,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              _imageContainer(widget.entity.imageUrl, width),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _titleContainer(widget.entity),
                      Row(
                        children: <Widget>[
                          _contantContainer(widget.entity),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<EmailedBloc>(context)
                                  .add(SetArticleFavoriteEvent(widget.entity));
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            child: _buttonContainer(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
