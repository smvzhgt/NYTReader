import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import 'favorite_button_widget.dart';

class ArticleRowItem extends StatelessWidget {
  final ArticleEntity entity;
  const ArticleRowItem({
    Key? key,
    required this.entity,
  }) : super(key: key);

  void _onClickRow() async {
    final url = entity.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _setImageWidget(String url) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      height: 80.0,
      width: 80.0,
      child: ClipOval(
          child: entity.imageUrl.isNotEmpty
              ? Image.network(entity.imageUrl, fit: BoxFit.cover)
              : Image(image: AssetImage(kNoImagePlaceholder))),
    );
  }

  Widget _articleTitleTextWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: Text(entity.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
    );
  }

  Widget _articleBodyTextWidget(String text) {
    return Expanded(
      child: Text(entity.articleAbstract,
          overflow: TextOverflow.ellipsis, maxLines: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onClickRow,
      child: Container(
        height: 90.0,
        child: Row(
          children: [
            _setImageWidget(entity.imageUrl),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _articleTitleTextWidget(entity.title),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _articleBodyTextWidget(entity.articleAbstract),
                          FavoriteButtonWidget(entity: entity)
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
