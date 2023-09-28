import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            provider.isDarkmode()
                ? Image.asset('assets/images/head_dark.png',
                    width: 73, height: 70)
                : Image.asset('assets/images/head.png', width: 73, height: 70),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: provider.isDarkmode()
                  ? Image.asset('assets/images/dark_body_of_seb7a.png',
                      width: 220, height: 180)
                  : Image.asset('assets/images/body_of_seb7a.png',
                      width: 220, height: 180),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    '30',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: provider.isDarkmode()
                            ? MyTheme.whiteColor
                            : MyTheme.blackColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: provider.isDarkmode()
                      ? MyTheme.primaryDark
                      : MyTheme.primaryLight,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.sobhan_allah,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: provider.isDarkmode()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLight,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(8),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
