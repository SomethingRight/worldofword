import 'package:flutter/material.dart';

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
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor),
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Center(
                    child: Text(
                  'Recovery your password',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                )),
                const SizedBox(height: 25),
                TextFieldCustomWidget(
                  obscureText: false,
                  controller: _emailController,
                  labelText: 'e-mail',
                  onSubmitted: (String text) {
                    //_bloc.add(ChangeEmailEvent(email: text));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    'Enter e-mail that you registered in the application to receive a password recovery code'),
                const SizedBox(
                  height: 25,
                ),
                StadiumCustomButton(
                    buttonBody: Text(
                      'send code',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 18),
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
