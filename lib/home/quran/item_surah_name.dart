import 'package:flutter/material.dart';
import 'package:islami/home/quran/surah_details_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSurahName extends StatelessWidget {
  String name;
  int index;

  ItemSurahName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SurahDetailsScreen.routName,
            arguments: SurahdeatailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: provider.isDarkmode()
            ? Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.whiteColor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
