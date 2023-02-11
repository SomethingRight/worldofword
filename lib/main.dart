import 'package:flutter/material.dart';

import 'module/home/home_page.dart';

// словарик
// список и кнопка добавить
// toolbar  с поиском добавить поисковую строку

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorldOfWord',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
