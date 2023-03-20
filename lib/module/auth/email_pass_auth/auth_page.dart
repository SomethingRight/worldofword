import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/main_bloc/main_bloc.dart';
import 'package:worldofword/models/app_state.dart';
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'package:worldofword/module/home/home_page.dart';
import 'package:worldofword/module/widgets/snackbar_global.dart';
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
        listener: (context, state) {
          if (state.status == StatusLogin.success) {
            SnackbarGlobal.show(
                message:
                    '${AppLocalizations.of(context)!.loggedInAs} ${state.email}',
                duration: 1500);

            Provider.of<MainBloc>(context, listen: false)
                .add(LoginStateChange(authState: LoginState()));
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
                          color: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<FirebaseAuthBloc>(context,
                                      listen: false)
                                  .add(ButtonLoginTapEvent());
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.confirm,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                GetIt.I<RouterI>()
                                    .navigateTo(RouterI.signUpPage);
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
                                GetIt.I<RouterI>()
                                    .navigateTo(RouterI.accountRecoveryPage);
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
