import 'package:flutter/material.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/src/scenes/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:nyt_news/di/injection.dart' as di;

void main() {
  di.init();
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      initialRoute: BottomNavigationPage.routeName,
      routes: {
        BottomNavigationPage.routeName: (context) =>
            const BottomNavigationPage()
      },
    );
  }
}
