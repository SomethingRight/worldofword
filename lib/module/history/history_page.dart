import 'package:flutter/material.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.title});

  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 24)),
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

 