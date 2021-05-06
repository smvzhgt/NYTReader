import 'package:flutter/material.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';

class EmailedArticleRow extends StatelessWidget {
  final ArticleEntity article;

  const EmailedArticleRow({
    Key? key,
    required this.article,
  }) : super(key: key);

  Widget _imageContainer(ArticleEntity article) {
    return Container(
      width: 80.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0),
        child: ClipOval(
            child: (article.imageUrl.isNotEmpty)
                ? Image.network(
                    article.imageUrl,
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  )
                : Image(image: AssetImage(kNoImagePlaceholder))),
      ),
    );
  }

  Widget _titleContainer(ArticleEntity entity) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(article.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            )),
      ),
      flex: 1,
    );
  }

  Widget _contentContainer(BuildContext context, ArticleEntity entity) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              article.articleAbstract,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Icon(
            Icons.star_border,
            size: 30.0,
            color: Theme.of(context).indicatorColor,
          ),
        ],
      ),
      flex: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 80.0,
        child: Row(
          children: <Widget>[
            _imageContainer(article),
            SizedBox(width: 3.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  _titleContainer(article),
                  _contentContainer(context, article)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
