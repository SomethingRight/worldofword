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
            content: Text('signed out'),
            duration: Duration(seconds: 1),
          ));
          await Future.delayed(const Duration(milliseconds: 1500));
          Navigator.pushReplacementNamed(context, RouterI.authPage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).primaryIconTheme,
            backgroundColor: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name:',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.userName,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            thickness: 1.6,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'e-mail:',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(state.email,
                              style: Theme.of(context).textTheme.headline6),
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
                  onPressed: () {
                    showSignupDialog();
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

  Future<void> showSignupDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('no')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _bloc.add(SignOut());
                },
                child: const Text('yes')),
          ],
        );
      },
    );
  }
}
