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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Artist`
  String get artist {
    return Intl.message(
      'Artist',
      name: 'artist',
      desc: '',
      args: [],
    );
  }

  /// `Album Name`
  String get album_name {
    return Intl.message(
      'Album Name',
      name: 'album_name',
      desc: '',
      args: [],
    );
  }

  /// `Explicit`
  String get explicit {
    return Intl.message(
      'Explicit',
      name: 'explicit',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Lyrics`
  String get lyrics {
    return Intl.message(
      'Lyrics',
      name: 'lyrics',
      desc: '',
      args: [],
    );
  }

  /// `No bookmark available.`
  String get no_bookmark_available {
    return Intl.message(
      'No bookmark available.',
      name: 'no_bookmark_available',
      desc: '',
      args: [],
    );
  }

  /// `BookMarks`
  String get bookmarks {
    return Intl.message(
      'BookMarks',
      name: 'bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `No data available.`
  String get no_data_available {
    return Intl.message(
      'No data available.',
      name: 'no_data_available',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection.`
  String get no_internet_connection_msg {
    return Intl.message(
      'No internet connection.',
      name: 'no_internet_connection_msg',
      desc: '',
      args: [],
    );
  }

  /// `false`
  String get false_ {
    return Intl.message(
      'false',
      name: 'false_',
      desc: '',
      args: [],
    );
  }

  /// `true`
  String get true_ {
    return Intl.message(
      'true',
      name: 'true_',
      desc: '',
      args: [],
    );
  }

  /// `Track Details`
  String get track_details {
    return Intl.message(
      'Track Details',
      name: 'track_details',
      desc: '',
      args: [],
    );
  }

  /// `TrackList`
  String get track_list {
    return Intl.message(
      'TrackList',
      name: 'track_list',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
