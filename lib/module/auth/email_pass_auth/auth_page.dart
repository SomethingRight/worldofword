import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'package:worldofword/module/widgets/stadium_custom_button.dart';
import 'package:worldofword/module/widgets/text_field_custom.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late FirebaseAuthBloc _bloc;
  bool _passwordInvisible = true;
  final _formKey = GlobalKey<FormState>();

@override
  void initState() {
    _bloc = getIt<FirebaseAuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
        bloc: _bloc,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w600),
                        )),
                        const SizedBox(height: 25),
                        TextFieldCustomWidget(
                          validator: (value) =>
                              state.isValidEmail ? null : 'incorrect e-mail',
                          obscureText: false,
                          labelText: 'e-mail',
                          onChanged: (String text) {
                            context
                                .read<FirebaseAuthBloc>()
                                .add(ChangeEmailEvent(email: text));
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldCustomWidget(
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : 'Password is too short(less then 8 signs)',
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
                              onChanged: (String text) {
                                context
                                    .read<FirebaseAuthBloc>()
                                    .add(ChangePassEvent(pass: text));
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
                                  color: Theme.of(context).hintColor,
                                  fontSize: 18),
                            ),
                            color: Theme.of(context).primaryColorLight,
                            onPressed: () async {
                              context
                                  .read<FirebaseAuthBloc>()
                                  .add(ButtonLoginTapEvent());
          
                              await Future.delayed(const Duration(seconds: 1));
          
                              Navigator.pushReplacementNamed(
                                  context, RouterI.homePage);
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouterI.signUpPage);
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
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
