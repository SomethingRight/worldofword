// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/module/auth/sign_up_auth/sign_up_bloc.dart';

import '../../widgets/stadium_custom_button.dart';
import '../../widgets/text_field_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpBloc _bloc;
  bool _passwordInvisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = getIt<SignUpBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: _bloc,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          content: Text(state.status!.name),
          duration: const Duration(milliseconds: 400),
        ));
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            iconTheme: Theme.of(context).primaryIconTheme,
          ),
          body: ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text('Enter information \n for your profile',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(fontWeight: FontWeight.w500))),
                      const SizedBox(height: 25),

                      //  all textfields
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldCustomWidget(
                            validator: (value) => state.isValidUsername
                                ? null
                                : 'Username is too short(less then 5 signs)',
                            obscureText: false,
                            labelText: 'user name',
                            onChanged: (String text) {
                              _bloc.add(ChangeNameEvent(name: text));
                            },
                          ),
                          const SizedBox(height: 5),
                          const Text(
                              'You can use any name, your neighbor\'s name or the president\'s name, you can even use your real name'),
                          const SizedBox(height: 25),
                          TextFieldCustomWidget(
                            validator: (value) =>
                                state.isValidEmail ? null : 'incorrect e-mail',
                            obscureText: false,
                            labelText: 'e-mail',
                            onChanged: (String text) {
                              _bloc.add(ChangeEmailEvent(email: text));
                            },
                          ),
                          const SizedBox(height: 5),
                          const Text(
                              'Enter the e-mail to which you have access in case you forget your password'),
                          const SizedBox(
                            height: 25,
                          ),
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
                              _bloc.add(ChangePassEvent(pass: text));
                            },
                            labelText: 'password',
                          ),
                          const SizedBox(height: 5),
                          const Text('Enter your password'),
                        ],
                      ),

                      //    confirm button
                      const SizedBox(
                        height: 35,
                      ),
                      StadiumCustomButton(
                        color: Theme.of(context).primaryColorDark,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await Future.delayed(
                                const Duration(seconds: 2), () {});

                            _bloc.add(const ConfirmSignUpEvent());
                          }
                        },
                        buttonBody: Text('confirm',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
