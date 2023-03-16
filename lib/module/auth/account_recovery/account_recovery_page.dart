import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/stadium_custom_button.dart';
import '../../widgets/text_field_custom.dart';

class AccountRecoveryPage extends StatefulWidget {
  const AccountRecoveryPage({super.key});

  @override
  State<AccountRecoveryPage> createState() => _AccountRecoveryPageState();
}

class _AccountRecoveryPageState extends State<AccountRecoveryPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        iconTheme: Theme.of(context).primaryIconTheme,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Center(
                    child: Text(
                        AppLocalizations.of(context)!.recoveryYourPassword,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w500))),
                const SizedBox(height: 25),
                TextFieldCustomWidget(
                  obscureText: false,
                  controller: _emailController,
                  labelText: 'e-mail',
                  onChanged: (String text) {
                    //_bloc.add(ChangeEmailEvent(email: text));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(AppLocalizations.of(context)!.enterEmailThatYouRegistered),
                const SizedBox(
                  height: 25,
                ),
                StadiumCustomButton(
                    child: Text(
                      AppLocalizations.of(context)!.sendCode,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    color: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.pushReplacementNamed(context, RouterI.authPage);
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
