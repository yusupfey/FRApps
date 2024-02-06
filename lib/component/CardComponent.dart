import 'dart:ffi';

import 'package:finreapps/model/transaction_model.dart';
import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  // final String name;
  // final String date;
  // final String amount;
  // final String status;
  final HistoryTransaction historyTransaction;
  const CardComponent({
    // required this.name,
    // required this.date,
    // required this.amount,
    // required this.status,
    required this.historyTransaction,
  });

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    print(widget.historyTransaction.id);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.historyTransaction.status == '0'
                    ? Color(0xffE3EDFC)
                    : Color(0xffFAE8FD),
              ),
              child: widget.historyTransaction.status == '0'
                  ? Icon(Icons.add)
                  : Icon(Icons.remove)),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.historyTransaction.name}',
                  style: greenTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  '${widget.historyTransaction.date}',
                  style: muteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 120,
            child: Text(
              'Rp. ${widget.historyTransaction.amount}',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
