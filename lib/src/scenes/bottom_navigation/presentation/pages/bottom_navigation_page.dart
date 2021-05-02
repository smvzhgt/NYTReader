import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/di/injection.dart';
import 'package:nyt_news/generated/l10n.dart';
import 'package:nyt_news/src/scenes/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:nyt_news/src/scenes/favorite/presentation/pages/favorite_page.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/pages/emailed_page.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/bloc/shared_bloc.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/pages/shared_page.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/bloc/viewed_bloc.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/pages/viewed_page.dart';

class BottomNavigationPage extends StatefulWidget {
  static const String routeName = '/';
  const BottomNavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;
  final List _pages = [
    BlocProvider(
      create: (context) => sl<EmailedBloc>(),
      child: const EmailedPage(),
    ),
    BlocProvider(
      create: (context) => sl<SharedBloc>(),
      child: const SharedPage(),
    ),
    BlocProvider(
      create: (context) => sl<ViewedBloc>(),
      child: const ViewedPage(),
    ),
    BlocProvider(
      create: (context) => sl<FavoriteBloc>(),
      child: const FavoritePage(),
    )
  ];

  List<BottomNavigationBarItem> _getItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.email, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE),
        label: S.of(context).emailed_label,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.share, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE),
        label: S.of(context).shared_label,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.picture_in_picture,
            size: BOTTOM_NAVIGATION_BAR_ICON_SIZE),
        label: S.of(context).viewed_label,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE),
        label: S.of(context).favorite_label,
      )
    ];
  }

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
          items: _getItems(context),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
