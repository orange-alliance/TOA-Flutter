import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './internationalization/localizations-delegate.dart';
import './ui/colors.dart' as TOAColors;
import './ui/views/events/events-list-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Orange Alliance',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: TOAColors.Colors().toaColors,
        accentColor: null,
        fontFamily: 'GoogleSans',
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))
          )
        ),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primarySwatch: TOAColors.Colors().toaColors,
        accentColor: TOAColors.Colors().toaColors.shade600,
        fontFamily: 'GoogleSans',
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))
          )
        ),
        brightness: Brightness.dark
      ),
      home: EventsListPage(),
      supportedLocales: [
        const Locale('en', 'US'), // English, must be first
        const Locale('he', 'IL'), // Hebrew
      ],
      localizationsDelegates: [
        const TOALocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        if (locale != null) {
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first; // Default: English
      },
    );
  }
}
