import 'dart:ffi';

class HistoryTransaction {
  late String id;
  late String name;
  late String date;
  late String amount;
  late String status;

  HistoryTransaction({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.status,
  });
  HistoryTransaction.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    date = map['date'];
    amount = map['amount'];
    status = map['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.compareTo(id),
      'name': name,
      'date': date,
      'amount': amount,
      'status': status
    };
  }
}
