import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/pages/error_page.dart';
import 'package:nyt_news/core/pages/loading_page.dart';
import 'package:nyt_news/core/widgets/article_row_item.dart';
import 'package:nyt_news/generated/l10n.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/bloc/shared_bloc.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({
    Key? key,
  }) : super(key: key);

  @override
  _SharedPageState createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    BlocProvider.of<SharedBloc>(context)
        .add(FetchSharedArticlesEvent(isCachedData: true));
  }

  void _updateArticles() {
    BlocProvider.of<SharedBloc>(context)
        .add(FetchSharedArticlesEvent(isCachedData: false));
  }

  void _onClickButton(ArticleEntity entity) {
    if (entity.isFavorite) {
      BlocProvider.of<SharedBloc>(context).add(DeleteFromFavoriteEvent(entity));
    } else {
      BlocProvider.of<SharedBloc>(context).add(AddToFavoriteEvent(entity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _updateArticles)
        ],
      ),
      body: Center(
        child: BlocBuilder<SharedBloc, SharedState>(
          builder: (context, state) {
            if (state is SharedLoadingState) {
              return const LoadingPage();
            } else if (state is SharedLoadedState) {
              final items = state.articles;
              return _buildList(items);
            } else if (state is SharedErrorState) {
              return const ErrorPage();
            } else if (state is SharedInitialState) {
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
        return ArticleRowItem(
            entity: entities[index], onClickButton: _onClickButton);
      },
      itemCount: entities.length,
    );
  }
}
