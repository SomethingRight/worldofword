import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/widgets/stadium_custom_button.dart';
import 'package:worldofword/module/widgets/text_field_custom.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Log In',
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
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                StadiumCustomButton(
                    buttonBody: Text(
                      'confirm',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 18),
                    ),
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouterI.homePage);
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          // GetIt.instance<RouterI>()
                          //     .navigateTo(RouterI.signUpPagePage);

                          Navigator.pushNamed(context, RouterI.signUpPage);
                        },
                        child: const Text(
                          'signUp',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 16),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouterI.accountRecoveryPage);
                          // GetIt.instance<RouterI>()
                          //     .navigateTo(RouterI.forgotPasswordPage);
                        },
                        child: const Text(
                          'forgot password',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
