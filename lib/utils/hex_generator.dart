import 'dart:math';

class HexGenerator
{
  static const _chars = 'AaBbCcDdEeFf1234567890';
  Random random = Random();

  String getRandomString(int length) => 
    String.fromCharCodes(
      Iterable.generate(
        length, 
        (_) => _chars.codeUnitAt(random.nextInt(_chars.length))
        )
      );
}