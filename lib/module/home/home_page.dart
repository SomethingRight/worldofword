import 'package:flutter/material.dart';
import 'package:worldofword/module/history/history_page.dart';
import 'package:worldofword/module/main_page/main_page.dart';
import '../menu/menu_page.dart';
import '../saved_words/saved_words_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> list = [
  const SavedWordsPage(title: 'Saved words'),
  const MainPage(title: 'World of word'),
  const HistoryPage(title: 'History'),
  const MenuPage(title: 'Menu'),
];

int selectedIndex = 1;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Icon(Icons.save_alt, size: 30)),
            label: '',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Icon(Icons.home, size: 30)),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Icon(Icons.history, size: 30)),
          ),
          BottomNavigationBarItem(
            icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Icon(Icons.menu, size: 30)),
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
