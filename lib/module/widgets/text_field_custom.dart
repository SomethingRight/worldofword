import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget({
    Key? key,
    required TextEditingController controller,
    this.onSubmitted,
    this.textInputAction,
    this.labelText,
    this.prefixIcon,
    this.fillColor,
    required this.obscureText,
    this.suffixIcon

  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final void Function(String)? onSubmitted;
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
      onSubmitted: onSubmitted,
      controller: _controller,
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