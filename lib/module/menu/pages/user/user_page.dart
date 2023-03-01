import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/di/service_locator.dart';
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

// TODO fix displayName not working 

class _UserPageState extends State<UserPage> {
  late UserPageBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<UserPageBloc>()..setUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageBloc, UserPageState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColorLight,
                          child: const Text('user')),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'name',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.userName,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                          const SizedBox(height: 8),
                          const Text(
                            'e-mail',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(state.email,
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
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
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                      IconButton(
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _bloc.add(SignOut());
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
