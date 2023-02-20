import 'package:flutter/material.dart';
import 'package:worldofword/module/widgets/text_field_custom.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                controller: emailController,
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
                    controller: passwordController,
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
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(210, 52),
                    backgroundColor: Theme.of(context).primaryColorLight,
                    shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text(
                  'confirm',
                  style: TextStyle(
                      color: Theme.of(context).hintColor, fontSize: 18),
                ),
              ),
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
    ));
  }
}
