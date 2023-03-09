// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/menu_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.title});

  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).primaryIconTheme,
          backgroundColor: Theme.of(context).primaryColor,
          title:
              Text(widget.title, style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            children: [
              MenuCard(
                  title: AppLocalizations.of(context)!.settings,
                  subtitle:  AppLocalizations.of(context)!.themeLanguageFontsize,
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.settingsPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title:  AppLocalizations.of(context)!.user,
                  subtitle:  AppLocalizations.of(context)!.nameVerificationData,
                  icon: Icon(Icons.people,
                      size: 30, color: Theme.of(context).primaryColorDark),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.userPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title:  AppLocalizations.of(context)!.shareApp,
                  subtitle:  AppLocalizations.of(context)!.emailMessageAndSocialMedia,
                  icon: Icon(Icons.share,
                      size: 30, color: Theme.of(context).primaryColorDark),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.sharingPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title:  AppLocalizations.of(context)!.info,
                  subtitle:  AppLocalizations.of(context)!.someInfoAboutApp,
                  icon: Icon(Icons.info,
                      size: 30, color: Theme.of(context).primaryColorDark),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.infoPage);
                  }),
            ],
          ),
        ));
  }
}
