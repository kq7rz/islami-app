import 'package:flutter/material.dart';
import 'package:islami/home/quran/surah_details_screen.dart';

class ItemSurahDetails extends StatelessWidget {
  String content;
  int index;

  ItemSurahDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content {${index + 1}}',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
