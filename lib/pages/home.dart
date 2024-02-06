import 'dart:async';

import 'package:finreapps/component/ActionComponent.dart';
import 'package:finreapps/component/CardComponent.dart';
import 'package:finreapps/model/transaction_model.dart';
import 'package:finreapps/pages/receive.dart';
import 'package:finreapps/pages/send.dart';
import 'package:finreapps/theme.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HistoryTransaction> historyTransaction = [];
  void initState() {
    super.initState();
    _inisialisasiGSheets();
  }

  var _credentials = r'''
    {
    "type": "service_account",
    "project_id": "finrecapps",
    "private_key_id": "4157ba5e227252e5baf9c6c6259ac9402c68ba94",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDDAy+0obHwCTmL\nwiNAcUfjE/008EXZoudGSRpisMM78GMVsNMaY9txzPQmmKKFuKqVYHnZAKjdIQyQ\niXhD5VIsrqibpxBe6CFu1ckZgwYkerKpVOzN+rfJUD3wLrW+pLBIvR+GInCaQ8Wj\n6B9R0GO3VSGf2mKDjK2dSvk4M8MOs1uwdadf/PuYTDagOFS19m+O8qC0DiwkvjPn\nhcsyJXiZE10+wTvQVUqH3PZAxjofd0fhwNwVJRuKS3r3WwADH2O8ZFFUJmR1zMKw\n7ftY4NL2CTfHrUu6wwoYvh/Gi1f1LxkTAyK6x2DiV2BH7PEM4eei+bN+ojvUyIm4\n1b0pdBpnAgMBAAECggEABNSXFdczZEP096mpATFz4K91x5CEySaFt8SiKPincE7h\n2GEYImP5Fc0Y+pSA78OX8vMDbW8f/E1kS08VQPzdTz7RdE2RGxyBIjyc1kEfTYn3\nWkYlsryPMJmcn5ITJt/vmnCX+2JnsGrzz4EaqX+9mCgHfhw+T/ohRdfOtYndAlH7\njtpEMez5RQz3CTCJhQd3F250rn25Q3ar8zeDa57xXRM3LDcdz4xSkiIBGs4vJq5n\nSNdhpFeRpFT4bKNG+BNGrk1yRhzNtDYbFZbfoBSjdMMUZTP7mOmNPp/ySZVpRaVC\nEiXtbUlIXjoYPPlkUxZIgQNUeSxE1fR5VyZqx7YXDQKBgQDvfEq1m/fClOevAuq4\nYr92GbIZF2CB/kv9LJe02n55BvV3RC9mRpyNKb+YJMFN1JjMzRMch7NxFbvKKIsF\nO9W8jllxxGNAjPF1FnWlEGauwKeyCq6UsT+HQqHTi3FQQXhBjh4/4tcud5qNCK1Z\n/mu/GDoIQCjUTLKCpghh2hK0XQKBgQDQdcxiOIAbKJj+HRUCXNhYFvtdaTI4eS6f\nysnqRfdHLhgIX0+AN6jcFrThFXh8dH0rSJ1N8/cS30CI83IbUzx8exEccepz9M4v\nHruGTS7fHmJoDOOQZ6hQMxGu+qeBSI2B0fWj5FSMWYZzBeM34USRfWZFqylUQcg6\nGlKk9ugdkwKBgQC97V22r+4LJFqlwnNyLeZX/ELxgUepcIrFS4M5C/s3cpxjrPDG\ndQOdNFndiHDBj/Rqn80jWD+oVKssxYCTcwOsWVx4TF7Gh8DKsjg040/8EZAtNCmG\nhRez5tU+Vx1Tn8iGfPZihj1Pfc1VQmdwssSytbz4ZCG9VOJRmOmW6QLihQKBgHzA\nQlP1ZBTcstJALTaAwafV+Q/pyHgrbU+LWFKvFFCwsQkxoK4moRM1M4IQC07Pl6iz\niBAClDXjDQfoSL05jtUgARl4wsoqEsn4Jlk1D3vO/y0tqXHd1shIB6kjr+KavLSY\nJdyy5DYpzWBAgb4LPbGjzfSbfdxCkcTTw+mdKUOpAoGAQgQt5lRIfUFUaSjOnm/C\nqcodDf/qrwHA3RwSAzB7ZH2iLOnQi6FWsn1a9S129YHG4joHPUyk2BCe1Rx9CUjH\nLO8F60XO71mKGtUT4P7iAWxZr3lIhXz2WedxxdrS/SNM14c5WPIpD2F7qhfR3gkH\nUwUJ5si1ZBqWdCyI8u63Mu4=\n-----END PRIVATE KEY-----\n",
    "client_email": "fincrec@finrecapps.iam.gserviceaccount.com",
    "client_id": "118402017720844193779",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fincrec%40finrecapps.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  }

  ''';
  Future<void> _inisialisasiGSheets() async {
    // GSheets _gsheets;
    var _spreadsheetId = '1P6n5LMmwo3BG0-LMiuVWQfnEMkZyd5NylcM67b009gE';
    final _gsheets = GSheets(_credentials);
    // await _gsheets.init();
    final ss = await _gsheets.spreadsheet(_spreadsheetId);

    var sheet = ss.worksheetByTitle("Sheet1");
    sheet ??= await ss.addWorksheet('Sheet1');

    // print(await sheet.values.allRows());

    List<Map<String, dynamic>>? data = await sheet.values.map.allRows();

    setState(() {
      historyTransaction =
          data!.map((map) => HistoryTransaction.fromMap(map)).toList();
    });
    historyTransaction.sort(
      (a, b) => int.parse(b.id).compareTo(int.parse(a.id)),
    );

    // print();
    // return history;
    // Sekarang Anda dapat berinteraksi dengan Google Spreadsheet
  }

  Future<void> getdata() async {
    _inisialisasiGSheets();
  }

  @override
  Widget Header() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo guys',
                    style: pinkTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'Lets save our money here',
                    style: primaryTextStyle.copyWith(
                      fontSize: 26,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget CardAction() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionComponent(
            color: pinkColor,
            title: 'Receive',
            path: 'assets/receive.png',
            route: ReceivePage(),
          ),
          SizedBox(
            width: 20,
          ),
          ActionComponent(
            color: purpleColor,
            title: 'Sent',
            path: 'assets/send.png',
            route: SendPage(),
          ),
        ],
      ),
    );
  }

  Widget CardTabungan() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pinkColor,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/image2.png',
            height: 250,
            width: 250,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Already Saved',
                  style: primaryTextStyle.copyWith(fontSize: 18),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. 100,000,000,00',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/eye.png',
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Transaction() {
    return Container(
        width: double.infinity,
        height: 550,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount:
                  historyTransaction.length < 5 ? historyTransaction.length : 5,
              itemBuilder: (BuildContext context, int index) {
                // print('index: ${index + 1}');
                print(historyTransaction[index].name);
                final trx = historyTransaction[index];
                return CardComponent(
                  historyTransaction: trx,
                );
              },
            ),
          ],
        )
        // historyTransaction
        //     .map((element) => CardComponent(
        //           historyTransaction: element,
        //         ))
        //     .toList(),
        // ),
        );
  }

  Widget build(BuildContext context) {
    // final HistoryTransaction historyTransaction =
    //     Provider.of<HistoryTransaction>(context);
    // print(historyTransaction);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                CardTabungan(),
                SizedBox(
                  height: 20,
                ),
                CardAction(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last 5 Transaction',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        getdata();
                        print('kesini');
                        // setState(() {
                        //   historyTransaction;
                        // });
                        print(historyTransaction.map((e) => e.name));
                      },
                      icon: Icon(Icons.history),
                      label: Text(''),
                    )
                  ],
                ),
                Transaction()
              ],
            ),
          )
        ],
      ),
    );
  }
}
