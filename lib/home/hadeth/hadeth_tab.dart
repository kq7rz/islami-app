import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethLines = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (hadethLines.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: provider.isDarkmode()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 4,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDarkmode()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 4,
        ),
        hadethLines.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkmode()
                          ? MyTheme.yellowColor
                          : Theme.of(context).primaryColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: hadethLines[index]);
                  },
                  itemCount: hadethLines.length,
                ),
              )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/hadeth.txt');
    List<String> ahadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      print(ahadethList[i]);
      print('------------------------');
      List<String> ahadethLines = ahadethList[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: ahadethLines);
      hadethLines.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
