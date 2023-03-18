import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/models/app_state.dart';
import 'package:worldofword/module/menu/pages/settings/settings_bloc.dart';
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/navigation/router.dart';
import '../../../widgets/snackbar_global.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserPageBloc, UserPageState>(
      listener: (context, state) {
        if (state.status == StatusUser.loggedOut) {
          SnackbarGlobal.show(
              message: AppLocalizations.of(context)!.signedOut, duration: 1500);

          Provider.of<SettingsBloc>(context, listen: false)
              .add(LoginStateChange(authState: UnloginState()));
              
          GetIt.I<RouterI>().pop();
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
                            '${AppLocalizations.of(context)!.name}:',
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
                            '${AppLocalizations.of(context)!.email}:',
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
                    children: [
                      Text(
                        AppLocalizations.of(context)!.signOut,
                        style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
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
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            AppLocalizations.of(context)!.areYouSure,
            style: Theme.of(context).textTheme.headline6,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  GetIt.I<RouterI>().pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.no,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Theme.of(context).primaryColor),
                )),
            TextButton(
                onPressed: () {
                  GetIt.I<RouterI>().pop();
                  Provider.of<UserPageBloc>(context, listen: false)
                      .add(SignOut());
                },
                child: Text(
                  AppLocalizations.of(context)!.yes,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Theme.of(context).primaryColor),
                )),
          ],
        );
      },
    );
  }
}
