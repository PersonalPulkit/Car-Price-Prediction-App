import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/network/FirestoreServices.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  FirestoreServices fs = FirestoreServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: fs.getHistoryFromFirestore(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: SizedBox(child: CircularProgressIndicator()));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return
              ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  Map<String, dynamic> data = doc.data() as Map<String, dynamic>; // Get the data
                  return ListTile(
                    trailing: Text("₹ ${doc['currentValue'].toString()}"),
                    title: Text(doc['brand']),
                    subtitle: Text("Average : ${doc["mileage"]}\nType : ${doc["type"]}"),

                    // Add more properties as needed
                  );
                },
              );
        }
      },
    );
  }
}
