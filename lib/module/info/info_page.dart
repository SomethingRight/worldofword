import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.title});

  final String title;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const Center(child: Text('some info about app', style: TextStyle(fontSize: 25),)),
    );
  }
}
