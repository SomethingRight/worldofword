import 'package:flutter/material.dart';

import '../../../core/navigation/router.dart';
import '../../widgets/stadium_custom_button.dart';
import '../../widgets/text_field_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _passwordInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor),
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  'Enter information \n for your profile',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                )),
                const SizedBox(height: 25),

                //  all textfields
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldCustomWidget(
                      obscureText: false,
                      controller: _userNameController,
                      labelText: 'user name',
                      onSubmitted: (String text) {
                        //_bloc.add(ChangeEmailEvent(email: text));
                      },
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        'You can use any name, your neighbor\'s name or the president\'s name, you can even use your real name'),
                    const SizedBox(height: 25),
                    TextFieldCustomWidget(
                      obscureText: false,
                      controller: _emailController,
                      labelText: 'e-mail',
                      onSubmitted: (String text) {
                        //_bloc.add(ChangeEmailEvent(email: text));
                      },
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        'Enter the e-mail to which you have access in case you forget your password'),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldCustomWidget(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordInvisible = !_passwordInvisible;
                            });
                          },
                          icon: Icon(_passwordInvisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined)),
                      obscureText: _passwordInvisible,
                      controller: _passwordController,
                      onSubmitted: (String text) {
                        // _bloc.add(ChangePassEvent(pass: text ));
                      },
                      labelText: 'password',
                    ),
                    const SizedBox(height: 5),
                    const Text('Enter your password'),
                    const SizedBox(height: 25),
                    TextFieldCustomWidget(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordInvisible = !_passwordInvisible;
                            });
                          },
                          icon: Icon(_passwordInvisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined)),
                      obscureText: _passwordInvisible,
                      controller: _repeatPasswordController,
                      onSubmitted: (String text) {
                        // _bloc.add(ChangePassEvent(pass: text ));
                      },
                      labelText: 'password',
                    ),
                    const SizedBox(height: 5),
                    const Text('Repeat password'),
                  ],
                ),

                //    confirm button
                const SizedBox(
                  height: 25,
                ),
                StadiumCustomButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    Navigator.pop(context);
                    //Navigator.pushReplacementNamed(context, RouterI.authPage);
                  },
                  text: 'confirm',
                ),
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


