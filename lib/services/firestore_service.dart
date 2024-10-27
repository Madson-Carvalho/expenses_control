import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_control/services/auth_service.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  getTotalExpenses() async {
    try {
      double total = 0;

      var expenses = await db
          .collection('Expenes_Control')
          .get();

      for (var doc in expenses.docs) {
        double value = doc['value'] ?? 0.0;
        total += value;
      }

      return (total);
    } catch (e) {
      rethrow;
    }
  }

  getLastExpenses() async {
    try {
      var expenses = await db
          .collection('Expenes_Control')
          .orderBy('date', descending: true)
          .limit(4)
          .get();

      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }

 postRegisterExpense(String expenseName, String value, String category, DateTime parsedDate, String comment) async {
    await db.collection('Expenses').add({
      "user": await FirebaseAuthService().checkUser(),
      "expense_name": expenseName,
      "value": value,
      "category": category,
      "date": parsedDate,
      "comment": comment,
      "created_at": DateTime.now(),
    });
  }

  getRegisterExpense() async {
    try {
      var expenses = await db.collection('Expenes_Control').orderBy('created_at', descending: true).get();
      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }
}
