import 'package:flutter/material.dart';

class StadiumCustomButton extends StatelessWidget {
  const StadiumCustomButton({
    Key? key,
    required this.buttonBody,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Widget buttonBody;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: const Size(210, 52),
          backgroundColor: color,
          shape: const StadiumBorder()),
      onPressed: onPressed,
      child:buttonBody
    );
  }
}