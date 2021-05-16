import 'package:flutter/material.dart';

class VilniusUniversityButtonStyle extends ButtonStyle {
  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return Color(0xFF690335);
        },
      );

  @override
  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return Color(0xFFFFFFFF);
        },
      );
}
