import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget(
      {Key? key,
      this.validator,
      this.controller,
      this.onChanged,
      this.textInputAction,
      this.labelText,
      this.prefixIcon,
      this.fillColor,
      required this.obscureText,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? labelText;
  final Icon? prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
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
