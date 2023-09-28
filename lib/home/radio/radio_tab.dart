import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/radio.png',
            height: 280,
            width: 360,
          ),
          Text(
            AppLocalizations.of(context)!.quran_karim_radio,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fast_forward_rounded,
                size: 50,
                color: provider.isDarkmode()
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLight,
              ),
              Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: provider.isDarkmode()
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLight,
              ),
              Icon(
                Icons.fast_rewind_rounded,
                size: 50,
                color: provider.isDarkmode()
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
