import 'package:flutter/material.dart';
import 'package:secured_chat_app/components/text_field_container.dart';
import 'package:secured_chat_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final bool enabled;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.people,
    this.onChanged,
    this.enabled,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textEditingController,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.person,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
