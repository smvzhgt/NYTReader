import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/pages/error_page.dart';
import 'package:nyt_news/core/pages/loading_page.dart';
import 'package:nyt_news/src/scenes/main/domain/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/main/presentation/bloc/main_bloc.dart';
import 'package:nyt_news/src/scenes/main/presentation/widgets/article_row_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New York Times'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(FetchNewsEvent());
              })
        ],
      ),
      body: Center(
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is MainLoadingState) {
              return const LoadingPage();
            } else if (state is MainLoadedState) {
              final items = state.news;
              return _buildList(items);
            } else if (state is MainErrorState) {
              return const ErrorPage();
            } else if (state is MainInitialState) {
              return Text('EMPTY');
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.email), title: Text('Emailed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.share), title: Text('Shared')),
          BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture), title: Text('Viewed')),
        ],
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
