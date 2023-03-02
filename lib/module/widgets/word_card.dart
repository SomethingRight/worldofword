import 'package:flutter/material.dart';

import '../../core/navigation/router.dart';
import '../../models/word_translate_model.dart';

class WordCard extends StatelessWidget {
  final WordTranslateModel word;
  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouterI.wordDetailsPage);
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Text('${word.word} ', style: const TextStyle(fontSize: 18)),
              Text('(${word.lexicalCategory})',
                  style: const TextStyle(fontSize: 18, color: Colors.black54)),
              Expanded(
                child: Text(
                  '${word.translate}',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 18),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
