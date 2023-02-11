import 'package:flutter/material.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(),
      body: Column(
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
                const Divider(
                  thickness: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.blueAccent,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add,
                            size: 30, color: Colors.blueAccent)),
                    IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(Icons.share, color: Colors.blueAccent)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.volume_up,
                            color: Colors.blueAccent)),
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
                        const Text(
                          'translation',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.blueAccent,
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
                        const Text(
                          'meaning',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.blueAccent,
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

          //something else
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
                        const Text(
                          'something else',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.blueAccent,
                            )),
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                  ],
                ),
                const Text(
                  'a single distinct meaningful element of speech or writing, used with others (or sometimes alone) to form a sentence and typically shown with a space on either side when written or printed.',
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
    );
  }
}