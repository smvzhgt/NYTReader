import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/pages/empty_favorite_page.dart';
import 'package:nyt_news/core/pages/error_page.dart';
import 'package:nyt_news/core/pages/loading_page.dart';
import 'package:nyt_news/core/widgets/article_row_item.dart';
import 'package:nyt_news/generated/l10n.dart';
import 'package:nyt_news/src/scenes/favorite/presentation/bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    BlocProvider.of<FavoriteBloc>(context).add(FetchFavoriteArticlesEvent());
  }

  void _onClickButton(ArticleEntity entity) {
    if (entity.isFavorite) {
      BlocProvider.of<FavoriteBloc>(context)
          .add(DeleteFromFavoriteEvent(entity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_title),
      ),
      body: Center(
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoadingState) {
              return const LoadingPage();
            } else if (state is FavoriteLoadedState) {
              return _buildList(state.articles);
            } else if (state is FavoriteErrorState) {
              return const ErrorPage();
            } else if (state is FavoriteInitialState) {
              return Container();
            } else if (state is FavoriteEmptyState) {
              return const EmptyFavoritePage();
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
          entity: entities[index],
          onClickButton: _onClickButton,
        );
      },
      itemCount: entities.length,
    );
  }
}
