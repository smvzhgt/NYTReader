import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: "New York Times Reader",
      initialRoute: BottomNavigationPage.routeName,
      routes: {
        BottomNavigationPage.routeName: (context) =>
            const BottomNavigationPage()
      },
    );
  }
}
