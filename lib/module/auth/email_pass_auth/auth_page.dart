import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/core/theme/theme.dart';
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
      body: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
        bloc: _bloc,
        listener: (context, state) async {
          if (state.status == StatusLogin.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 1500),
                content: Text('logged in as: ${state.email}')));

            Navigator.of(context).pushReplacementNamed(RouterI.homePage);
          }
          if (state.status == StatusLogin.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage ?? 'something went wrong')));
          }
        },
        builder: (context, state) {
          return ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
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
                        validator: (p0) {
                          return state.isEmailCorrect
                              ? null
                              : 'Enter correct e-mail';
                        },
                        obscureText: false,
                        labelText: 'e-mail',
                        onChanged: (String text) {
                          _bloc.add(ChangeEmailEvent(email: text));
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldCustomWidget(
                            validator: (p0) {
                              return state.isPasswordCorrect
                                  ? null
                                  : 'Password is too short(less then 8 signs)';
                            },
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
                              _bloc.add(ChangePassEvent(pass: text));
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _bloc.add(ButtonLoginTapEvent());
                            }
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),

                      // Google/apple login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('or, login with',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 16)),
                          if (defaultTargetPlatform ==
                              TargetPlatform.android) ...[
                            TextButton(
                              onPressed: () async {
                                _bloc.add(LoginWithGoogle());
                              },
                              child: Image.asset(
                                'assets/images/png/google_icon.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ] else if (defaultTargetPlatform ==
                              TargetPlatform.iOS) ...[
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/png/apple_icon.png',
                                width: 43,
                                height: 43,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
