import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              children: [
                 Center(
                  child: CircleAvatar(radius: 30,
                  backgroundColor: Theme.of(context).primaryColorLight,
                   child: const Text('user')),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'e-mail',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'vitalybattalov@gmail.com',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,),
                      Divider(),
                      SizedBox(height: 8),
                      Text(
                        'name',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Vitaly Battalov', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('delete profile',
                          style: TextStyle(fontSize: 20)),
                      IconButton(
                          icon: const Icon(Icons.delete_outline_outlined, color: Colors.red,),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            )));
  }
}
