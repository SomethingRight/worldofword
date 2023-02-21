import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart';
import 'package:worldofword/module/main_page/bloc/word_load_bloc.dart';

import '../widgets/text_field_custom.dart';
import '../widgets/word_card.dart';

//TODO
//авторизация firebase и сохранять там же
//Добавить фичу контекстное меню, новый пункт сохранения слова с словарь

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();

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
              //TextField Custom 
              TextFieldCustomWidget(
                obscureText: false,
                controller: _controller,
                onSubmitted: (String text) {
                  Provider.of<WordLoadBloc>(context, listen: false)
                      .add(WordLoading(_controller.text));
                },
                textInputAction: TextInputAction.search,
                labelText: 'what a you looking for',
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.black12,
              ),
              const SizedBox(
                height: 15,
              ),

              //Here will be results of search

              Center(
                child: BlocBuilder<WordLoadBloc, WordLoadState>(
                  builder: (context, state) {
                    if (state is WordEmptyState) {
                      return const Offstage();
                    } else if (state is WordLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WordError) {
                      return Center(child: Text(state.error));
                    } else if (state is WordLoadedState) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.words.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.all(10),
                                child: WordCard(word: state.words[index]));
                          });
                    }
                    return const Center(
                      child: Text(
                        'Enter something',
                        style: TextStyle(fontSize: 25),
                      ),
                    );
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


