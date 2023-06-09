import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget(
      {Key? key,
      this.errorText,
      this.validator,
      this.controller,
      this.onChanged,
      this.textInputAction,
      this.labelText,
      this.prefixIcon,
      this.fillColor,
      required this.obscureText,
      this.focusNode,
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
  final String? errorText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
