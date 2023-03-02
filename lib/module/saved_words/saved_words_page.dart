import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:worldofword/module/saved_words/saved_words_bloc.dart';

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
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                _bloc.add(StartSavedList());
              },
              icon: const Icon(Icons.refresh))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: BlocBuilder<SavedWordsBloc, SavedWordsState>(
          bloc: _bloc,
          builder: (context, state) {
            debugPrint(state.toString());
            if (state is SavedWordsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SavedWordsLoaded) {
              return SlidableAutoCloseBehavior(
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
                                  onPressed: (context) => onTapDelete(index),
                                  backgroundColor: Colors.red.shade400,
                                  icon: Icons.delete,
                                  label: 'delete',
                                )
                              ],
                            ),
                            child: WordCard(word: state.savedList![index])),
                      );
                    }),
              );
            }
            return const Center(
              child: Text(
                'You don\'t have saved words',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}

void onTapDelete(int index){

}