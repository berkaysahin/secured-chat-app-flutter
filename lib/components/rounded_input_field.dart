import 'package:flutter/material.dart';
import 'package:secured_chat_app/components/text_field_container.dart';
import 'package:secured_chat_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool enabled;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.people,
    this.onChanged,
    this.enabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
