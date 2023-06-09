import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/models/word_translate_model.dart';
import 'package:worldofword/module/saved_words/saved_words_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:worldofword/module/widgets/snackbar_global.dart';

class WordCardIcon extends StatelessWidget {
  final WordTranslateModel word;
  const WordCardIcon({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetIt.I<RouterI>().navigateTo(RouterI.wordDetailsPage,
            arg: {'word': word.word, 'translation': word.translate});
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.68,
              child: Row(
                children: [
                  Text('${word.word} ',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('(${word.languageCode})',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey.shade600)),
                  Expanded(
                    child: Text(
                      '${word.translate}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline5,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  GetIt.I<SavedWordsBloc>().add(AddToSavedList(word: word));

                  SnackbarGlobal.show(
                      message: AppLocalizations.of(context)!.wordSaved,
                      duration: 300);
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
