// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';

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
                  title: 'Settings',
                  subtitle: 'theme, language and fontsize',
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.settingsPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title: 'User',
                  subtitle: 'name, verification data',
                  icon: Icon(Icons.people,
                      size: 30, color: Theme.of(context).primaryColor),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.userPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title: 'Share app',
                  subtitle: 'email, message and social media',
                  icon: Icon(Icons.share,
                      size: 30, color: Theme.of(context).primaryColor),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.sharingPage);
                  }),
              const SizedBox(height: 7),
              MenuCard(
                  title: 'Info',
                  subtitle: 'some info about app',
                  icon: Icon(Icons.info,
                      size: 30, color: Theme.of(context).primaryColor),
                  onTap: () {
                    Navigator.pushNamed(context, RouterI.infoPage);
                  }),
            ],
          ),
        ));
  }
}
