import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/core/settings/theme.dart';
import 'package:worldofword/module/widgets/snackbar_global.dart';
import 'package:worldofword/module/word_details_page/word_details_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          backgroundColor: headerColor,
          iconTheme: Theme.of(context).primaryIconTheme),
      body: BlocBuilder<WordDetailsBloc, WordDetailsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is WordDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WordDetailsLoaded) {
            debugPrint(state.wordDetails.phrases.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  // word and icons
                  Container(
                    width: double.infinity,
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: 44),
                        ),
                        Text('[ ${state.wordDetails.phoneticSpelling} ]',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: Variables.fontSize)),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Material(
                          clipBehavior: Clip.none,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    final copiedWord = ClipboardData(
                                        text: state.wordDetails.word);
                                    Clipboard.setData(copiedWord);

                                    SnackbarGlobal.show(
                                        message: AppLocalizations.of(context)!
                                            .copied,
                                        duration: 300);
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: iconColor,
                                  )),
                              IconButton(
                                  splashRadius: 22,
                                  onPressed: () {
                                    SnackbarGlobal.show(
                                        message: AppLocalizations.of(context)!
                                            .wordSaved,
                                        duration: 300);
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
                                    SnackbarGlobal.show(
                                        message: AppLocalizations.of(context)!
                                            .playing,
                                        duration: 1000);

                                    Provider.of<WordDetailsBloc>(context,
                                            listen: false)
                                        .add(PlayAudio(
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
                      color: Theme.of(context).cardColor,
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
                                  AppLocalizations.of(context)!.translation,
                                  style: TextStyle(
                                      fontSize: 22, color: headerColor),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                      splashRadius: 22,
                                      onPressed: () {
                                        final copiedTranslation = ClipboardData(
                                            text: widget.translation);
                                        Clipboard.setData(copiedTranslation);

                                        SnackbarGlobal.show(
                                            message:
                                                AppLocalizations.of(context)!
                                                    .copied,
                                            duration: 300);
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        color: iconColor,
                                      )),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        Text(widget.translation,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(fontSize: Variables.fontSize)),
                      ],
                    ),
                  ),

                  //meaning
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
                                  AppLocalizations.of(context)!.meaning,
                                  style: TextStyle(
                                      fontSize: 22, color: headerColor),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                      splashRadius: 22,
                                      onPressed: () {
                                        final copiedMeaning = ClipboardData(
                                            text:
                                                state.wordDetails.definitions);
                                        Clipboard.setData(copiedMeaning);

                                        SnackbarGlobal.show(
                                            message:
                                                AppLocalizations.of(context)!
                                                    .copied,
                                            duration: 300);
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        color: iconColor,
                                      )),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        Text(
                          state.wordDetails.definitions ??
                              AppLocalizations.of(context)!.noMeanings,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(fontSize: Variables.fontSize),
                        )
                      ],
                    ),
                  ),

                  // phrases
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.phrases,
                                    style: TextStyle(
                                        fontSize: 22, color: headerColor),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.wordDetails.phrases?.length ?? 1,
                          itemBuilder: (context, index) {
                            if (state.wordDetails.phrases?[index] != null) {
                              return ListTile(
                                  dense: true,
                                  horizontalTitleGap: 2,
                                  leading: Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              130),
                                      child: const Icon(Icons.circle, size: 8)),
                                  title: Text(state.wordDetails.phrases?[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(
                                              fontSize: Variables.fontSize)));
                            }
                            if (state.wordDetails.phrases == null) {
                              return ListTile(
                                  dense: true,
                                  horizontalTitleGap: 2,
                                  leading: Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              130),
                                      child: const Icon(Icons.circle, size: 8)),
                                  title: Text(
                                      AppLocalizations.of(context)!
                                          .noExamplesOfPhrases,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(
                                              fontSize: Variables.fontSize)));
                            } else {
                              return const Offstage();
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  // synonyms
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.synonyms,
                                    style: TextStyle(
                                        fontSize: 22, color: headerColor),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.wordDetails.synonyms?.length ?? 1,
                          itemBuilder: (context, index) {
                            return ListTile(
                                dense: true,
                                horizontalTitleGap: 2,
                                leading: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                130),
                                    child: const Icon(Icons.circle, size: 8)),
                                title: Text(
                                    state.wordDetails.synonyms?[index] ??
                                        AppLocalizations.of(context)!
                                            .noExamplesOfSynonyms,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.copyWith(
                                            fontSize: Variables.fontSize)));
                          },
                        ),
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
