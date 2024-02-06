import 'package:finreapps/pages/receive.dart';
import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class ActionComponent extends StatelessWidget {
  Color color;
  String title;
  String path;
  final route;
  ActionComponent(
      {required this.color,
      required this.title,
      required this.path,
      this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 166,
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      child: TextButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          )
        },
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              path,
              height: 103,
              width: 107,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',
                  style: whiteTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_right_alt_sharp,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
