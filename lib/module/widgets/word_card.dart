import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/models/word_translate_model.dart';

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
        padding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.68,
              child: Row(
                children: [
                  Text('${word.word}', style: const TextStyle(fontSize: 18)),
                  Text('(${word.lexicalCategory})',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54)),
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
            ),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 300),
                      content: Text('word saved')));
                },
                icon:  Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
