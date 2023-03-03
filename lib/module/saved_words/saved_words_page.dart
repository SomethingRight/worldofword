import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/api/firestore/firestore_provider.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/home/home_page.dart';
import 'package:worldofword/module/saved_words/saved_words_bloc.dart';

import '../widgets/word_card.dart';

class SavedWordsPage extends StatefulWidget {
  const SavedWordsPage({super.key, required this.title});

  final String title;

  @override
  State<SavedWordsPage> createState() => _SavedWordsPageState();
}

class _SavedWordsPageState extends State<SavedWordsPage> {
  FirestoreProviderI fbService = GetIt.I<FirestoreProviderI>();
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
        title: Text(widget.title),
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
                                                  .savedList![index].translate!));
                                        });
                
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                duration:
                                                    Duration(milliseconds: 400),
                                                content: Text(
                                                  'word removed',
                                                  style: TextStyle(fontSize: 16),
                                                )));
                                      },
                                      backgroundColor: Colors.red.shade400,
                                      icon: Icons.delete,
                                      label: 'delete',
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
                    // lets save some words
                    children: [
                      const Text(
                        'It\'s empty for now.',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Let\'s', style: TextStyle(fontSize: 20)),
                          TextButton(
                            onPressed: () {
                              //Navigator.pushReplacementNamed(context, RouterI.homePage);
                            },
                            child: Text(
                              'save',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                          ),
                          const Text('some words',
                              style: TextStyle(fontSize: 20)),
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
