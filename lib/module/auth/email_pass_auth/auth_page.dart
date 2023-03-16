import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'package:worldofword/module/widgets/stadium_custom_button.dart';
import 'package:worldofword/module/widgets/text_field_custom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _passwordInvisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
        listener: (context, state) async {
          if (state.status == StatusLogin.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).dialogBackgroundColor,
                duration: const Duration(milliseconds: 1500),
                content: Text(
                    '${AppLocalizations.of(context)!.loggedInAs} ${state.email}')));

            Navigator.of(context).pushReplacementNamed(RouterI.homePage,
                arguments: {'index': 1});
          }
          if (state.status == StatusLogin.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).dialogBackgroundColor,
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
                      Center(
                          child: Text(
                        AppLocalizations.of(context)!.logIn,
                        style: const TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w600),
                      )),
                      const SizedBox(height: 25),
                      TextFieldCustomWidget(
                        validator: (p0) {
                          return state.isEmailCorrect
                              ? null
                              : AppLocalizations.of(context)!.enterCorrectEmail;
                        },
                        obscureText: false,
                        labelText: AppLocalizations.of(context)!.email,
                        onChanged: (String text) {
                          Provider.of<FirebaseAuthBloc>(context, listen: false)
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
                            validator: (p0) {
                              return state.isPasswordCorrect
                                  ? null
                                  : AppLocalizations.of(context)!
                                      .passwordIsTooShort;
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
                              Provider.of<FirebaseAuthBloc>(context,
                                      listen: false)
                                  .add(ChangePassEvent(pass: text));
                            },
                            labelText: AppLocalizations.of(context)!.password,
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
                            AppLocalizations.of(context)!.confirm,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 18),
                          ),
                          color: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<FirebaseAuthBloc>(context,
                                      listen: false)
                                  .add(ButtonLoginTapEvent());
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
                              child: Text(
                                AppLocalizations.of(context)!.signUp,
                                style: const TextStyle(
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
                              child: Text(
                                AppLocalizations.of(context)!.forgotPassword,
                                style: const TextStyle(
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
                          Text(AppLocalizations.of(context)!.orLoginWith,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 16)),
                          if (defaultTargetPlatform ==
                              TargetPlatform.android) ...[
                            TextButton(
                              onPressed: () async {
                                Provider.of<FirebaseAuthBloc>(context,
                                        listen: false)
                                    .add(LoginWithGoogle());
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
