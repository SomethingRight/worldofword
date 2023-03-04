import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:worldofword/module/word_details_page/word_details_bloc.dart';

class WordDetailsPage extends StatefulWidget {
  const WordDetailsPage(
      {super.key, required this.word, required this.translation});
  final String word;
  final String translation;

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  late WordDetailsBloc _bloc;

  @override
  void initState() {
    _bloc = GetIt.I<WordDetailsBloc>()..init(widget.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final headerColor = Theme.of(context).primaryColor;
    final iconColor = Theme.of(context).primaryColorDark;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(),
      body: BlocBuilder<WordDetailsBloc, WordDetailsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is WordDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WordDetailsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // word and icons
                  Container(
                    width: double.infinity,
                    height: 180,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.wordDetails.word!,
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        Text(
                          '[ ${state.wordDetails.phoneticSpelling} ]',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Material(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration:
                                                Duration(milliseconds: 300),
                                            content: Text('copied')));
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: iconColor,
                                  )),
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration:
                                                Duration(milliseconds: 300),
                                            content: Text('word saved')));
                                  },
                                  icon: Icon(Icons.add,
                                      size: 30, color: iconColor)),
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {},
                                  icon: Icon(Icons.share, color: iconColor)),
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text('playing...')));

                                    _bloc.add(PlayAudio(
                                        audioPath:
                                            state.wordDetails.audioPath!));
                                  },
                                  icon:
                                      Icon(Icons.volume_up, color: iconColor)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // translation
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'translation',
                                  style: TextStyle(
                                      fontSize: 22, color: headerColor),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      color: iconColor,
                                    )),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        Text(
                          widget.translation,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),

                  //meaning
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'meaning',
                                  style: TextStyle(
                                      fontSize: 22, color: headerColor),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      color: iconColor,
                                    )),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        Text(
                          state.wordDetails.definitions!,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),

                  // lexical category
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'lexical category',
                                  style: TextStyle(
                                      fontSize: 22, color: headerColor),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      color: iconColor,
                                    )),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        Text(
                          state.wordDetails.lexicalCategory!,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Offstage();
        },
      ),
    );
  }
}
