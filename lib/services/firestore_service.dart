import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  getTotalExpenses() async {
    try {
      double total = 0;

      var expenses = await db.collection('Expenes_Control').get();

      for (var doc in expenses.docs) {
        var value = doc['value'];
        double valueAsDouble = (value is double)
            ? value
            : (value is int)
                ? value.toDouble()
                : 0.0;
        total += valueAsDouble;
      }

      return total;
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

  postRegisterExpense(String expenseName, double value, String category,
      DateTime parsedDate, String comment) async {
    await db.collection('Expenes_Control').add({
      "title": expenseName,
      "value": value,
      "category": category,
      "date": parsedDate,
      "aditional_notes": comment,
    });
  }

  getRegisterExpense() async {
    try {
      var expenses = await db
          .collection('Expenes_Control')
          .orderBy('created_at', descending: true)
          .get();
      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }

  getAllExpenses() async {
    try {
      var expenses = await db
          .collection('Expenes_Control')
          .orderBy('date', descending: true)
          .get();

      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }

  getAllCategories() async {
    try {
      var expenses = await db
          .collection('Expenes_Control')
          .where('category')
          .orderBy('date', descending: true)
          .get();

      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }

  putRegisterExpense(String id, String expenseName, double value,
      String category, DateTime parsedDate, String comment) async {
    await db.collection('Expenes_Control').add({
      "Document ID": id,
      "title": expenseName,
      "value": value,
      "category": category,
      "date": parsedDate,
      "aditional_notes": comment,
    });
  }
}
