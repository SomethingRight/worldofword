import 'package:flutter/material.dart';
import 'package:worldofword/models/word_model.dart';
import 'package:worldofword/module/word_details_page/word_details_page.dart';

class WordCard extends StatelessWidget {
  final WordModel word;
  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WordDetailsPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(word.word, style: const TextStyle(fontSize: 18)),
            ),
            Row(
              children: [
                Text(word.translate, style: const TextStyle(fontSize: 18)),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('word saved')));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blueAccent,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
