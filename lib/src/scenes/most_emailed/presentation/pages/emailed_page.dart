import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/pages/error_page.dart';
import 'package:nyt_news/core/pages/loading_page.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/widgets/emailed_article_row.dart';

class EmailedPage extends StatefulWidget {
  const EmailedPage({
    Key key,
  }) : super(key: key);

  @override
  _EmailedPageState createState() => _EmailedPageState();
}

class _EmailedPageState extends State<EmailedPage> {
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    BlocProvider.of<EmailedBloc>(context).add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh), onPressed: _fetchArticles)
        ],
      ),
      body: Center(
        child: BlocBuilder<EmailedBloc, EmailedState>(
          builder: (context, state) {
            if (state is EmailedLoadingState) {
              return const LoadingPage();
            } else if (state is EmailedLoadedState) {
              final items = state.articles;
              return _buildList(items);
            } else if (state is EmailedErrorState) {
              return const ErrorPage();
            } else if (state is EmailedInitialState) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<ArticleEntity> entities) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return EmailedArticleRow(article: entities[index]);
        },
        itemCount: entities.length);
  }
}
