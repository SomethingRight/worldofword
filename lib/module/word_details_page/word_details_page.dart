import 'package:flutter/material.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerColor = Theme.of(context).primaryColor;
    final iconColor = Theme.of(context).primaryColorDark;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                  const Text(
                    'Word',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                  const Text(
                    '[wərd]',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text('copied')));
                          },
                          icon: Icon(
                            Icons.copy,
                            color: iconColor,
                          )),
                      IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text('word saved')));
                          },
                          icon: Icon(Icons.add,
                              size: 30, color: iconColor)),
                      IconButton(
                          onPressed: () {},
                          icon:  Icon(Icons.share,
                              color: iconColor)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.volume_up,
                              color: iconColor)),
                    ],
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
                            style: TextStyle(fontSize: 22, color: headerColor),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:  Icon(
                                Icons.copy,
                                color:iconColor,
                              )),
                        ],
                      ),
                      const Divider(
                        thickness: 2.0,
                      ),
                    ],
                  ),
                  const Text(
                    'слово',
                    style: TextStyle(
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
                            style: TextStyle(fontSize: 22, color:headerColor),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy,
                                color:iconColor,
                              )),
                        ],
                      ),
                      const Divider(
                        thickness: 2.0,
                      ),
                    ],
                  ),
                  const Text(
                    'used to express agreement or affirmation',
                    style: TextStyle(
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
                            style: TextStyle(fontSize: 22, color:headerColor),
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
                  const Text(
                    'noun',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
