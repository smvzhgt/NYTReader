import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/pages/error_page.dart';
import 'package:nyt_news/core/pages/loading_page.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/widgets/article_row_widget.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/bloc/viewed_bloc.dart';

class ViewedPage extends StatefulWidget {
  const ViewedPage({
    Key key,
  }) : super(key: key);

  @override
  _ViewedPageState createState() => _ViewedPageState();
}

class _ViewedPageState extends State<ViewedPage> {
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    BlocProvider.of<ViewedBloc>(context).add(FetchViewedArticlesEvent());
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
        child: BlocBuilder<ViewedBloc, ViewedState>(
          builder: (context, state) {
            if (state is ViewedLoadingState) {
              return const LoadingPage();
            } else if (state is ViewedLoadedState) {
              final items = state.articles;
              return _buildList(items);
            } else if (state is ViewedErrorState) {
              return const ErrorPage();
            } else if (state is ViewedInitialState) {
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
          return ArticleRowWidget(entity: entities[index]);
        },
        itemCount: entities.length);
  }
}
