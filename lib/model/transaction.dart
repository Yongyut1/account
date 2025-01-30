class Transaction {
  String title;
  double amount;
  DateTime date;

  Transaction({required this.title, required this.amount, DateTime? date})
      : date = date ?? DateTime.now();
}
