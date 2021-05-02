// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Emailed`
  String get emailed_label {
    return Intl.message(
      'Emailed',
      name: 'emailed_label',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared_label {
    return Intl.message(
      'Shared',
      name: 'shared_label',
      desc: '',
      args: [],
    );
  }

  /// `Viewed`
  String get viewed_label {
    return Intl.message(
      'Viewed',
      name: 'viewed_label',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite_label {
    return Intl.message(
      'Favorite',
      name: 'favorite_label',
      desc: '',
      args: [],
    );
  }

  /// `New York Times Reader`
  String get app_title {
    return Intl.message(
      'New York Times Reader',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Error loading articles`
  String get error_loading_data_label {
    return Intl.message(
      'Error loading articles',
      name: 'error_loading_data_label',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}