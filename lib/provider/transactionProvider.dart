import 'package:account/model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = []; // เริ่มต้นเป็นค่าว่าง

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    notifyListeners();
  }
}
