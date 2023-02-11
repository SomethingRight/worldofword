import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  labelText: 'what a you looking for',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.black12,
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Text(
                    'History :',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height*0.68,
                child: ListView.builder(
                  itemCount: WordModel.words.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: WordCard(
                        word: words[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
