import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_details_screen.dart';
import 'package:islami/home/quran/surah_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SurahDetailsScreen.routName: (context) => SurahDetailsScreen(),
        HadethDetailsScreen.routName: (context) => HadethDetailsScreen(),
      },
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
    );
  }
}
