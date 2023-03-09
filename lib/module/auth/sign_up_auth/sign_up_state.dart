// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

enum SignupStatus { success, failure, loading }

class SignUpState extends Equatable {
  const SignUpState(
      {required this.userName,
      required this.email,
      required this.password,
      this.status});

  final String userName;
  final String email;
  final String password;
  final SignupStatus? status;
  bool get isValidUsername => userName.length >= 5;
  bool get isValidEmail => email.contains('@');
  bool get isValidPassword => password.length >= 8;

  @override
  List<Object?> get props => [userName, email, password, status];

  SignUpState copyWith(
      {String? userName,
      String? email,
      String? password,
      SignupStatus? status}) {
    return SignUpState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  var ints = List<String>.generate(10, (index) => index.toString());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReorderableListView.builder(
            itemBuilder: (context, index) {
              return ColorfulBox(
                key: ValueKey(ints[index]),
              );
            },
            itemCount: ints.length,
            onReorder: _onReorder),
            Text('lol', key: UniqueKey())
      ],
    );
  }

  void _onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }
      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }
}

class ColorfulBox extends StatelessWidget {
  final color = UniqeColorGenerator.getColor();

  ColorfulBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class UniqeColorGenerator {
  static final random = Random();
  static Color getColor() {
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
  }
}
