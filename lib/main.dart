import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nyt_news/core/theme.dart';
import 'package:nyt_news/di/injection.dart' as di;
import 'package:nyt_news/src/scenes/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'generated/l10n.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(App(savedThemeMode: savedThemeMode));
}

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp(
        title: "New York Times Reader",
        theme: light,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: BottomNavigationPage.routeName,
        routes: {
          BottomNavigationPage.routeName: (context) =>
              const BottomNavigationPage()
        },
      ),
    );
  }
}
