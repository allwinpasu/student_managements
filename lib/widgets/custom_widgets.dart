import 'package:flutter/material.dart';

Widget customTextField({
  required String label,
  required Function(String) onChanged,
  bool obscureText = false,
}) {
  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(labelText: label),
    obscureText: obscureText,
  );
}
