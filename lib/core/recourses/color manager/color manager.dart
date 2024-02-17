import 'package:flutter/material.dart';

class MyColors {
  static Color transparent = Colors.transparent;
  static Color primary1 = const Color.fromRGBO(2, 175, 197, 1);
  static Color primary2 = const Color.fromRGBO(53, 201, 221, 1);
  static Color primary3 = const Color.fromRGBO(135, 209, 219, 1);
  static Color primary4 = const Color.fromRGBO(169, 243, 253, 1);
  static Color primary5 = const Color.fromRGBO(151, 206, 76, 1);
  static Color primary6 = Color.fromARGB(255, 181, 231, 110);

  static Color gray1 = const Color.fromRGBO(131, 139, 142, 1);
  static Color gray2 = const Color.fromRGBO(154, 160, 163, 1);
  static Color gray3 = const Color.fromRGBO(177, 181, 183, 1);
  static Color gray4 = const Color.fromRGBO(199, 203, 204, 1);
  static Color gray5 = const Color.fromRGBO(222, 224, 224, 1);
  static Color gray6 = const Color.fromRGBO(222, 224, 224, .2);
  static Color black1 = const Color.fromRGBO(0, 0, 0, 1.0);
  static Color black2 = const Color.fromRGBO(49, 49, 49, 1.0);
  static Color black3 = const Color.fromRGBO(98, 98, 98, 1.0);
  static Color black4 = const Color.fromRGBO(147, 147, 147, 1.0);
  static Color black5 = const Color.fromRGBO(196, 196, 196, 0.15);
  static Color white = const Color.fromRGBO(255, 255, 255, 1.0);

  //dark mode
  static Color darkPrimary = const Color.fromRGBO(28, 31, 36, 1.0);
}

// BoxDecoration gradientBoxDecoration() {
//   return Get.isDarkMode
//       ? const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//               Color.fromRGBO(72, 106, 215, 1.0),
//               Color.fromRGBO(72, 106, 215, 0.5098039215686274),
//             ]))
//       : const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//               Color.fromRGBO(21, 228, 231, 1.0),
//               Color.fromRGBO(156, 185, 189, 1.0),
//               Color.fromRGBO(199, 193, 208, 1.0),
//               Color.fromRGBO(21, 228, 231, 1.0),
//               Color.fromRGBO(199, 193, 208, 1.0),
//               Color.fromRGBO(156, 185, 189, 1.0),
//               Color.fromRGBO(21, 228, 231, 1.0),
//             ]));
// }
