import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

// import '../theme.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'login page',
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
