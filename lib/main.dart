import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/src/scenes/main/data/datasources/main_remote_data_source.dart';
import 'package:nyt_news/src/scenes/main/data/repositories/main_repository.dart';
import 'package:nyt_news/src/scenes/main/domain/interactor/main_interactor.dart';
import 'package:nyt_news/src/scenes/main/presentation/bloc/main_bloc.dart';
import 'package:nyt_news/src/scenes/main/presentation/pages/main_page.dart';

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
      home: BlocProvider(
        create: (context) => MainBloc(interactor),
        child: const MainPage(),
      ),
    );
  }
}
