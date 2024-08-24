import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final CollectionReference user =
      FirebaseFirestore.instance.collection("users");

  // Create user

  // Save data
  Future<void> addDataToFirestore(
      String brand, double currentValue, double mileage, String type) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final currentData = {
        'uid': user.uid,
        'brand': brand,
        'currentValue': currentValue,
        'mileage': mileage,
        'type': type,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection("history")
          .doc()
          .set(currentData);
    }
  }

  // Read all saved data
  Future<QuerySnapshot<Map<String, dynamic>>> getHistoryFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var history = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection("history")
          .get();
      return history;

    }
    else{
      throw Exception('No user logged in');
    }

  }
}
