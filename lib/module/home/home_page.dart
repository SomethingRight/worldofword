import 'package:flutter/material.dart';
import 'package:worldofword/module/main_page.dart/main_page.dart';

import '../info/info_page.dart';
import '../search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> list = [
  const MainPage(title: 'World of word'),
  const SearchPage(title: 'Search'),
  const InfoPage(title: 'Info'),
];

int selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.home, size: 30)),
            ),
             BottomNavigationBarItem(
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.search, size: 30)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.info, size: 30)),
              label: '',
            ),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      body: list[selectedIndex],
    );
  }
}
