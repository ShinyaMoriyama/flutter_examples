import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'app_localization.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) =>
      ["en", "it", "es"].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    print('called');
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> d) => false;
}
