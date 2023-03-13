import 'package:flutter/material.dart';
import 'package:worldofword/module/history/history_page.dart';
import 'package:worldofword/module/main_page/main_page.dart';
import '../menu/menu_page.dart';
import '../saved_words/saved_words_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.inIndex});

  int inIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget listOf(int index) {
  switch (index) {
    case 0:
      return const SavedWordsPage(title: 'Saved Words');
    case 1:
      return const MainPage(title: 'World of Word');
    case 2:
      return const HistoryPage(title: 'History');
    case 3:
      return const MenuPage(title: 'Menu');
    default:
      return const MainPage(title: 'World of Word');
  }
}

// int selectedIndex = 1;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 25,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColorDark,
          currentIndex: widget.inIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.bookmarks_outlined, size: 28)),
              label: '',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.home_outlined, size: 32)),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.history_outlined, size: 30)),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Icon(Icons.menu_sharp, size: 32)),
              label: '',
            ),
          ],
          onTap: (index) {
            setState(() {
              widget.inIndex = index;
            });
          },
        ),
        body: listOf(widget.inIndex));
  }
}
