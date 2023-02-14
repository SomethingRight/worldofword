import 'package:flutter/material.dart';
import 'package:worldofword/models/word_details_model.dart';

import '../widgets/word_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.title});

  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final List<WordDetailsModel> words = WordDetailsModel.words;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //   child: Builder(builder: (context) {
      //     if (words.isEmpty) {
      //       const Center(
      //         child: Text(
      //           'History of search',
      //           style: TextStyle(fontSize: 20),
      //         ),
      //       );
      //     }
      //     return ListView.builder(
      //       itemCount: WordDetailsModel.words.length,
      //       itemBuilder: (context, index) {
      //         return Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 7),
      //           child: WordCard(
      //             word: ,
      //           ),
      //         );
      //       },
      //     );
      //   }),
      // ),
    );
  }
}

 