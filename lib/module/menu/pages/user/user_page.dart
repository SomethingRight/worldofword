import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/di/service_locator.dart';
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart';

import '../../../../core/navigation/router.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserPageBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<UserPageBloc>()..setUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserPageBloc, UserPageState>(
      bloc: _bloc,
      listener: (context, state) async {
        if (state.status == StatusUser.loggedOut) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('logged out'),
            duration: Duration(seconds: 1),
          ));
          await Future.delayed(const Duration(milliseconds: 1500));
          Navigator.pushReplacementNamed(context, RouterI.authPage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const Center(
                        child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/png/user_avatar.png'),
                      radius: 70,
                    )),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
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
                          const Divider(
                            thickness: 1.6,
                          ),
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
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(145, 70),
                      backgroundColor: Theme.of(context).dividerColor,
                      shape: const StadiumBorder()),
                  onPressed: () async {
                    _bloc.add(SignOut());
                    // await Future.delayed(const Duration(seconds: 1));
                    // Navigator.of(context)
                    //     .pushReplacementNamed(RouterI.authPage);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'sign out',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.redAccent,
                      ),
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
