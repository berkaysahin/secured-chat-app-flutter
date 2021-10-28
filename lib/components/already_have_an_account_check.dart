import 'package:flutter/material.dart';
import 'package:secured_chat_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Hesabın yok mu? " : "Zaten hesabın var mı? ",
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Kayıt Ol!" : "Giriş Yap!",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
