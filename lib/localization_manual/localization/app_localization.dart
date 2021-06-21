import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;
  const AppLocalization(this.locale);
  static AppLocalization? of(BuildContext ctx) =>
      Localizations.of<AppLocalization>(ctx, AppLocalization);
  static Map<String, Map<String, String>> _db = {
    "en": {
      "hello": "Hello!",
      "hello_world": "Hello world",
    },
    "it": {
      "hello": "Ciao!",
      "hello_world": "Ciao mondo",
    },
    "es": {
      "hello": "Hola!",
      "hello_world": "Hola Mundo",
    }
  };
}

extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this)?.locale.languageCode ?? "en";
    // final database = AppLocalization._localizedValues;
    final database = AppLocalization._db;

    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database["en"]?[value] ?? "-";
    }
  }
}
