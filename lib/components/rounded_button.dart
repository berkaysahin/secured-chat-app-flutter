import 'package:flutter/material.dart';
import 'package:secured_chat_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: press,
          style: ElevatedButton.styleFrom(
              primary: color,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
