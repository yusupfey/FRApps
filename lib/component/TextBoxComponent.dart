import 'package:finreapps/atoms/textbox.dart';
import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class TextBoxComponent extends StatelessWidget {
  const TextBoxComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Label :',
            style: muteTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          TextBox(),
        ],
      ),
    );
  }
}
