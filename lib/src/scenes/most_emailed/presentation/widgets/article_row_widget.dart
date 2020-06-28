import 'package:flutter/material.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleRowWidget extends StatelessWidget {
  final ArticleEntity entity;
  const ArticleRowWidget({Key key, this.entity}) : super(key: key);

  void _onClickRow() async {
    final url = entity.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: GestureDetector(
        onTap: _onClickRow,
        child: Container(
          height: height * 0.1,
          child: Row(
            children: <Widget>[
              Image.network(
                entity.imageUrl,
                fit: BoxFit.fitHeight,
                height: height * 0.1,
                width: height * 0.1,
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        entity.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          child: Text(
                            entity.articleAbstract,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}