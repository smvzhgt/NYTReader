import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/repositories/emailed_repository.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/interactor/emailed_interactor.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/pages/emailed_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final List _pages = [
    BlocProvider(
      create: (context) => EmailedBloc(EmailedInteractorImpl(
          EmailedRepositoryImpl(EmailedRemoteDataSourceImpl()))),
      child: const EmailedPage(),
    ),
    Scaffold(
      body: Center(child: const Text('Most Shared Articles')),
    ),
    Scaffold(
      body: Center(child: const Text('Most Viewed Articles')),
    ),
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
