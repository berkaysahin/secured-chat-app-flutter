// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secured_chat_app/components/text_field_container.dart';
import 'package:secured_chat_app/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;

  const RoundedPasswordField({
    Key key,
    @required this.onChanged,
    @required this.textEditingController,
  }) : super(key: key);

  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordField> {
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.textEditingController,
        obscureText: isPasswordShow,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Şifre",
          icon: const Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordShow = !isPasswordShow;
              });
            },
            icon: isPasswordShow
                ? const Icon(
                    Icons.visibility,
                    color: primaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: primaryColor,
                  ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
