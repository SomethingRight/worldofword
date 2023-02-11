// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            children: [
              MenuCard(
                  title: 'Settings',
                  subtitle: 'theme, language and fontsize',
                  icon: const Icon(Icons.settings),
                  onTap: () {}),
              const SizedBox(height: 5),
              MenuCard(
                  title: 'User',
                  subtitle: 'name, verification data',
                  icon: const Icon(Icons.people),
                  onTap: () {}),
              const SizedBox(height: 5),
              MenuCard(
                  title: 'Share app',
                  subtitle: 'email, message and social media',
                  icon: const Icon(Icons.share),
                  onTap: () {}),
              const SizedBox(height: 5),
              MenuCard(
                  title: 'Info',
                  subtitle: 'some info about app',
                  icon: const Icon(Icons.info),
                  onTap: () {}),
            ],
          ),
        ));
  }
}