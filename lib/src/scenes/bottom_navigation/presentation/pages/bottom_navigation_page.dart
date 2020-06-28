import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/repositories/emailed_repository.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/interactor/emailed_interactor.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/pages/emailed_page.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/data/repositories/shared_repository.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/interactor/shared_interactor.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/bloc/shared_bloc.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/pages/shared_page.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/repositories/viewed_repository.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/interactor/viewed_interactor.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/bloc/viewed_bloc.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/pages/viewed_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final List _pages = [
    BlocProvider(
      create: (context) => EmailedBloc(EmailedInteractorImpl(
          EmailedRepositoryImpl(EmailedRemoteDataSourceImpl(ApiClientImpl())))),
      child: const EmailedPage(),
    ),
    BlocProvider(
      create: (context) => SharedBloc(SharedInteractorImpl(
          SharedRepositoryImpl(SharedRemoteDataSourceImpl(ApiClientImpl())))),
      child: const SharedPage(),
    ),
    BlocProvider(
      create: (context) => ViewedBloc(ViewedInteractorImpl(
          ViewedRepositoryImpl(ViewedRemoteDataSourceImpl(ApiClientImpl())))),
      child: const ViewedPage(),
    )
  ];

  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.email),
      title: Text('Emailed'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.share),
      title: Text('Shared'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.picture_in_picture),
      title: Text('Viewed'),
    ),
  ];

  void _onClickItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onClickItem,
          currentIndex: _currentIndex,
          items: _items,
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
