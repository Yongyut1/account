import 'package:account/model/transaction.dart';
import 'package:account/provider/transactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มข้อมูล',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple.shade800, // สีของ AppBar เป็นสีม่วงเข้ม
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                label: const Text('ชื่อรายการ', style: TextStyle(color: Colors.white70)),
                filled: true,
                fillColor: Colors.purple.shade700, // สีพื้นหลังของ TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              autofocus: true,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                label: const Text('จำนวนเงิน', style: TextStyle(color: Colors.white70)),
                filled: true,
                fillColor: Colors.purple.shade700, // สีพื้นหลังของ TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade600, // สีปุ่มเป็นสีม่วง
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    amountController.text.isNotEmpty) {
                  final String title = titleController.text;
                  final double amount =
                      double.tryParse(amountController.text) ?? 0.0;

                  if (amount > 0) {
                    Provider.of<TransactionProvider>(context, listen: false)
                        .addTransaction(Transaction(
                      title: title,
                      amount: amount,
                      date: DateTime.now(),
                    ));
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text(
                'เพิ่มข้อมูล',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
