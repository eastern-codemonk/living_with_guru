
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper
{
  static Future<void> addRecord(String collectionName, dynamic record) async {
    Firestore.instance.collection(collectionName).add(record);
  }
}