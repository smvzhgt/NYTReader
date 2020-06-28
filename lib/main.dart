import 'package:flutter/material.dart';
import 'package:nyt_news/src/scenes/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:nyt_news/src/scenes/main/data/datasources/main_remote_data_source.dart';
import 'package:nyt_news/src/scenes/main/data/repositories/main_repository.dart';
import 'package:nyt_news/src/scenes/main/domain/interactor/main_interactor.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final MainInteractor interactor;
  App({Key key})
      : interactor =
            MainInteractorImpl(MainRepositoryImpl(MainRemoteDataSourceImpl())),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New York Times Reader',
      home: const BottomNavigationPage(),
    );
  }
}
