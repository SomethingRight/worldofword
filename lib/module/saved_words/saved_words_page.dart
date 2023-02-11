import 'package:flutter/material.dart';

class SavedWordsPage extends StatefulWidget {
  const SavedWordsPage({super.key, required this.title});

  final String title;

  @override
  State<SavedWordsPage> createState() => _SavedWordsPageState();
}

class _SavedWordsPageState extends State<SavedWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Center(child: Text('Let\'s save some words', style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}
