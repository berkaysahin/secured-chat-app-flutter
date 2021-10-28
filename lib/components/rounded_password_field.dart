import 'package:flutter/material.dart';
import 'package:secured_chat_app/components/text_field_container.dart';
import 'package:secured_chat_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: "Şifre",
        icon: Icon(
          Icons.lock,
          color: primaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: primaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
