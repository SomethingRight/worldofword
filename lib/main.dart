import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart';
import 'package:worldofword/module/main_page/bloc/word_load_bloc.dart';

import 'module/home/home_page.dart';

// словарик
// список и кнопка добавить

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WordLoadBloc>(
            create: (context) => WordLoadBloc(WordTranslateRepository()),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
