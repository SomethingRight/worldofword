import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:worldofword/module/main_page/main_page.dart';
import 'package:worldofword/module/saved_words/saved_words_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/word_card.dart';

class SavedWordsPage extends StatefulWidget {
  const SavedWordsPage({super.key, required this.title});

  final String title;

  @override
  State<SavedWordsPage> createState() => _SavedWordsPageState();
}

class _SavedWordsPageState extends State<SavedWordsPage> {
  late SavedWordsBloc _bloc;

  @override
  void initState() {
    _bloc = GetIt.I<SavedWordsBloc>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: BlocBuilder<SavedWordsBloc, SavedWordsState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is SavedWordsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SavedWordsLoaded) {
              if (state.savedList!.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    _bloc.add(StartSavedList());
                  },
                  child: SlidableAutoCloseBehavior(
                    closeWhenTapped: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.savedList?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      borderRadius: BorderRadius.circular(15),
                                      onPressed: (context) {
                                        setState(() {
                                          _bloc.add(RemoveFromSavedList(
                                              translation: state
                                                  .savedList![index]
                                                  .translate!));
                                        });

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .dialogBackgroundColor,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                content: Text(
                                                  AppLocalizations.of(context)!
                                                      .wordRemoved,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                )));
                                      },
                                      backgroundColor: Colors.red.shade400,
                                      icon: Icons.delete,
                                      label:
                                          AppLocalizations.of(context)!.delete,
                                    )
                                  ],
                                ),
                                child: WordCard(word: state.savedList![index])),
                          );
                        }),
                  ),
                );
              }
              if (state.savedList!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.itsEmptyForNow,
                        style: const TextStyle(fontSize: 22),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.letS,
                              style: const TextStyle(fontSize: 22)),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.save,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Text(AppLocalizations.of(context)!.someWords,
                              style: const TextStyle(fontSize: 22)),
                        ],
                      )
                    ],
                  ),
                );
              }
            }
            return const Offstage();
          },
        ),
      ),
    );
  }
}
