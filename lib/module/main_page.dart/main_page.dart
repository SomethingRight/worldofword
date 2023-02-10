import 'package:flutter/material.dart';

import '../../models/word_model.dart';
import '../widgets/word_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<WordModel> words = WordModel.words;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: WordModel.words.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: WordCard(
                  word: words[index],
                ));
          },
        ),
      ),
    );
  }
}
