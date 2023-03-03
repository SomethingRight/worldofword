import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/module/main_page/word_load_bloc.dart';

import '../../core/DI/service_locator.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/word_card_icon.dart';

//TODO
//Добавить фичу контекстное меню, новый пункт сохранения слова с словарь

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WordLoadBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<WordLoadBloc>();
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TextField Custom
              TextFieldCustomWidget(
                obscureText: false,
                onChanged: (String text) {
                  _bloc.add(WordLoading(text));
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

              BlocBuilder<WordLoadBloc, WordLoadState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is WordEmptyState) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1),
                        child:
                            Image.asset('assets/images/png/search_page.png'));
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
                              child: WordCardIcon(word: state.words[index]));
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
            ],
          ),
        ),
      ),
    );
  }
}
