import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/quran/item_surah_details.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SurahDetailsScreen extends StatefulWidget {
  static const String routName = 'surah-details-screen';

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahdeatailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    loadFile(args.index);
    return Stack(
      children: [
        provider.isDarkmode()
            ? Image.asset(
                'assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              '${args.name}',
              style: provider.isDarkmode()
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.yellowColor)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.blackColor),
            ),
          ),
          body: verses.length == 0
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: provider.isDarkmode()
                          ? MyTheme.primaryDark
                          : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return ItemSurahDetails(
                        content: verses[index],
                        index: index,
                      );
                    }),
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SurahdeatailsArgs {
  String name;
  int index;

  SurahdeatailsArgs({required this.name, required this.index});
}
