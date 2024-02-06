import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: primaryTextStyle.copyWith(fontSize: 16),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Masukan Sesuatu',
        ),
      ),
    );
  }
}
