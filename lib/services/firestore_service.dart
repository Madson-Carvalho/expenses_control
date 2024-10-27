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
}
