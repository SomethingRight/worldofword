import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget(
      {Key? key,
      this.controller,
      this.onSubmitted,
      this.onChanged,
      this.textInputAction,
      this.labelText,
      this.prefixIcon,
      this.fillColor,
      required this.obscureText,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? labelText;
  final Icon? prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
