import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/module/main_page/word_load_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/text_field_custom.dart';
import '../widgets/word_card_icon.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;
  static bool isFocused = false;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    if (MainPage.isFocused == true) {
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => FocusScope.of(context).requestFocus(focusNode));
    }
    setState(() {
      MainPage.isFocused = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title, style: Theme.of(context).textTheme.headline1),
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
                focusNode: focusNode,
                obscureText: false,
                onChanged: (String text) {
                  if (text.trim().isEmpty) {
                    Provider.of<WordLoadBloc>(context, listen: false)
                        .add(WordEmpty());
                  } else {
                    Provider.of<WordLoadBloc>(context, listen: false)
                        .add(WordLoading(word: text));
                  }
                },
                textInputAction: TextInputAction.search,
                labelText: AppLocalizations.of(context)!.whatAreYouLookingFor,
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.black12,
              ),
              const SizedBox(
                height: 15,
              ),

              //Here will be results of search

              BlocBuilder<WordLoadBloc, WordLoadState>(
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
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: const EdgeInsets.all(10),
                              child: WordCardIcon(word: state.word));
                        });
                  }
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.enterSomething,
                      style: const TextStyle(fontSize: 25),
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
