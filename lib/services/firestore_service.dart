import 'package:cloud_firestore/cloud_firestore.dart';

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

 postRegisterExpense(String expenseName, double value, String category, DateTime parsedDate, String comment) async {
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
      var expenses = await db.collection('Expenes_Control').orderBy('created_at', descending: true).get();
      return expenses.docs;
    } catch (e) {
      rethrow;
    }
  }

  getAllExpenses() async {
    try {
      var expenses = await db.collection('Expenes_Control').get();

      return expenses.docs.map((doc) {
        return {
          'title': doc['title'],
          'category': doc['category'],
          'date': doc['date'],
          'value': doc['value'],
        };
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
