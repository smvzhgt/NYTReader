import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import 'favorite_button_widget.dart';

class ArticleRowItem extends StatelessWidget {
  final ArticleEntity entity;
  Function(ArticleEntity entity) onClickButton;

  ArticleRowItem({
    Key? key,
    required this.entity,
    required this.onClickButton,
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
      margin: const EdgeInsets.only(right: 8.0),
      height: 75.0,
      width: 75.0,
      child: ClipOval(
          child: entity.imageUrl.isNotEmpty
              ? Image.network(entity.imageUrl, fit: BoxFit.cover)
              : Image(image: AssetImage(kNoImagePlaceholder))),
    );
  }

  Widget _articleTitleTextWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, right: 4.0, top: 2.0),
      child: Text(entity.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          maxLines: 2),
    );
  }

  Widget _articleBodyTextWidget(String text) {
    return Expanded(
      child: Text(entity.articleAbstract,
          overflow: TextOverflow.ellipsis, maxLines: 3),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _articleBodyTextWidget(entity.articleAbstract),
                        FavoriteButtonWidget(
                            entity: entity, onClickButton: onClickButton)
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
