import 'package:flutter/material.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleRowWidget extends StatelessWidget {
  final ArticleEntity entity;
  const ArticleRowWidget({Key? key, required this.entity}) : super(key: key);

  void _onClickRow() async {
    final url = entity.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _setImageWidget(String url, double height) {
    if (url.isEmpty) {
      return Image.asset(NO_IMAGE_PLACEHOLDER);
    } else {
      return Image.network(
        url,
        fit: BoxFit.fitHeight,
        height: height * 0.1,
        width: height * 0.1,
      );
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
              _setImageWidget(entity.imageUrl, height),
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
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      child: Icon(
                        Icons.star_border,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
