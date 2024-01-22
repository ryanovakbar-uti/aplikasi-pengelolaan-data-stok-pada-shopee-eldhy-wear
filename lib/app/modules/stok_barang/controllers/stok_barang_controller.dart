import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StokBarangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference object = firestore.collection('eldhywear_data');

    return object.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference object = firestore.collection('eldhywear_data');

    return object.snapshots();
  }
}
