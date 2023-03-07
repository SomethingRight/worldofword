import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15, vertical: 25),
        child: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'This application allows you to search and share useful words. Store them in a convenient format of your own dictionary. I believe that the application will be useful and interesting for you.',
                  style: TextStyle(fontSize: 26),
                ),
                Text('(c) worldofword.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
