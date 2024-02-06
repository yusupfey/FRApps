import 'package:finreapps/component/TextBoxComponent.dart';
import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  @override
  PreferredSizeWidget header() {
    return AppBar(
      title: Text(
        'Receive',
        style: whiteTextStyle.copyWith(fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: pinkColor,
      foregroundColor: whiteTextColor,
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [TextBoxComponent()],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [content()],
      ),
    );
  }
}
