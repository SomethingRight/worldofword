import 'dart:async';

import 'package:flutter/material.dart';
import 'package:worldofword/api/word_api/word_translate_api.dart';
import 'package:worldofword/models/word_translate_model.dart';

import '../widgets/word_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  late StreamController _streamController;
  late Stream _stream;

  _search(String word) async {
    final word = await WordTranslateApi().getWord(_controller.text);
    _streamController.add(word);
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (String text) {
                  _search(text = _controller.text);
                },
                controller: _controller,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  labelText: 'what a you looking for',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
          
              //Here will be results of search

              Center(
                child: StreamBuilder(
                  stream: _stream,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                          child: Text(
                        'enter something...',
                        style: TextStyle(fontSize: 28),
                      ));
                    }
                    return Container(
                        padding: const EdgeInsets.all(10),
                        child: WordCard(word: snapshot.data));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
