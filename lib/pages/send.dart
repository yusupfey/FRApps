import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  PreferredSizeWidget header() {
    return AppBar(
      title: Text(
        'Send',
        style: whiteTextStyle.copyWith(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: purpleColor,
      foregroundColor: whiteTextColor,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
    );
  }
}
