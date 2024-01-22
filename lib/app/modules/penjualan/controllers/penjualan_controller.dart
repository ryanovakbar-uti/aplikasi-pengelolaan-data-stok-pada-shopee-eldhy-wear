import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenjualanController extends GetxController {
  //TODO: Implement PenjualanController
  late TextEditingController cNamaPembeli;
  late TextEditingController cNamaBarang;
  late TextEditingController cJumlahBarang;
  late TextEditingController cUpdateJumlahBarang;
  late TextEditingController cHargaBarang;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference object = firestore.collection('eldhywear_penjualan');

    return object.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference object = firestore.collection('eldhywear_penjualan');

    return object.snapshots();
  }

  void add(String namaPembeli, String namaBarang, String jumlahBarang, String hargaBarang) async {
    String? documentNumber;
    String value = '';
    
    switch (namaBarang) {
      case 'Kemeja Alisan Panjang Slim Fit Putih':
        documentNumber = '1';
        break;
      case 'Celana Training Panjang Reseleting Saku':
        documentNumber = '2';
        break;
      case 'CD Celana Dalam Crocodile 521-262':
        documentNumber = '3';
        break;
      case 'Handuk Gucci 70 x 140 cm':
        documentNumber = '4';
        break;
      default:
    }

    DocumentReference docRef = firestore.collection('eldhywear_data').doc(documentNumber);

    await firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(docRef);

      if (snapshot.exists) {
        value = (int.parse(snapshot.get('jumlah_barang')) - int.parse(jumlahBarang)).toString();

        if (int.parse(value) < 0 || int.parse(jumlahBarang) <= 0) {
          return;
        }

        transaction.update(docRef, {'jumlah_barang': value});
      }
    });

    if (int.parse(value) < 0 || int.parse(jumlahBarang) <= 0) {
      return;
    }


    CollectionReference object = firestore.collection('eldhywear_penjualan');

    int pembeliIndex = await object.count().get().then((value) => value.count);
    pembeliIndex++;

    try {
      if (namaPembeli != '' && namaBarang != '' && int.tryParse(jumlahBarang) != null && int.tryParse(hargaBarang) != null) {
        await object.doc(pembeliIndex.toString()).set({
          'nama_pembeli': namaPembeli,
          'nama_barang': namaBarang,
          'jumlah_barang': jumlahBarang,
          'harga_barang': hargaBarang,
        });

        Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil menambahkan data Penjualan',
          onConfirm: () {
            cNamaPembeli.clear();
            cNamaBarang.clear();
            cJumlahBarang.clear();
            cHargaBarang.clear();
            Get.back();
            Get.back();
          },
          textConfirm: 'OK',
          confirmTextColor: Colors.black,
          backgroundColor: Colors.amber,
          buttonColor: Colors.white,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Gagal menambahkan data Penjualan',
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection('eldhywear_penjualan').doc(id);

    return docRef.get();
  }

  void Update(String namaPembeli, String namaBarang, String jumlahBarang, String hargaBarang, String id) async {
    String? documentNumber;
    String value = '';
    
    switch (namaBarang) {
      case 'Kemeja Alisan Panjang Slim Fit Putih':
        documentNumber = '1';
        break;
      case 'Celana Training Panjang Reseleting Saku':
        documentNumber = '2';
        break;
      case 'CD Celana Dalam Crocodile 521-262':
        documentNumber = '3';
        break;
      case 'Handuk Gucci 70 x 140 cm':
        documentNumber = '4';
        break;
      default:
    }

    DocumentReference docRef = firestore.collection('eldhywear_data').doc(documentNumber);

    await firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(docRef);

      if (snapshot.exists) {
        value = (int.parse(snapshot.get('jumlah_barang')) - int.parse(cUpdateJumlahBarang.text)).toString();

        if (int.parse(value) < 0 || int.parse(jumlahBarang) <= 0) {
          return;
        } else if (int.parse(cJumlahBarang.text) > int.parse(cUpdateJumlahBarang.text)) {
          value = (int.parse(snapshot.get('jumlah_barang')) + (int.parse(cJumlahBarang.text) - int.parse(cUpdateJumlahBarang.text))).toString();
          transaction.update(docRef, {'jumlah_barang': value});
        } else if (int.parse(cJumlahBarang.text) < int.parse(cUpdateJumlahBarang.text)) {
          value = (int.parse(snapshot.get('jumlah_barang')) - (int.parse(cUpdateJumlahBarang.text) - int.parse(cJumlahBarang.text))).toString();
          transaction.update(docRef, {'jumlah_barang': value});
        }
      }
    });

    if (int.parse(value) < 0 || int.parse(jumlahBarang) <= 0) {
      return;
    }

    
    DocumentReference objectById = firestore.collection('eldhywear_penjualan').doc(id);

    try {
      if (namaPembeli != '' && namaBarang != '' && int.tryParse(jumlahBarang) != null && int.tryParse(hargaBarang) != null) {
        await objectById.update({
          'nama_pembeli': namaPembeli,
          'nama_barang': namaBarang,
          'jumlah_barang': jumlahBarang,
          'harga_barang': hargaBarang,
        });

        Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil mengubah data Penjualan',
          onConfirm: () {
            cNamaPembeli.clear();
            cNamaBarang.clear();
            cJumlahBarang.clear();
            cHargaBarang.clear();
            Get.back();
            Get.back();
          },
          textConfirm: 'OK',
          confirmTextColor: Colors.black,
          backgroundColor: Colors.amber,
          buttonColor: Colors.white,
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Gagal mengubah data Penjualan',
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection('eldhywear_penjualan').doc(id);

    try {
      Get.defaultDialog(
        title: 'Info',
        middleText: 'Apakah anda yakin menghapus data ini?',
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: 'Sukses',
            middleText: 'Berhasil menghapus data Penjualan',
          );
        },
        textConfirm: 'OK',
        confirmTextColor: Colors.black,
        textCancel: 'Batal',
        cancelTextColor: Colors.red,
        buttonColor: Colors.amber,
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menghapus data Penjualan',
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNamaPembeli = TextEditingController();
    cNamaBarang = TextEditingController();
    cJumlahBarang = TextEditingController();
    cUpdateJumlahBarang = TextEditingController();
    cHargaBarang = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNamaPembeli.dispose();
    cNamaBarang.dispose();
    cJumlahBarang.dispose();
    cUpdateJumlahBarang.dispose();
    cHargaBarang.dispose();
    super.onClose();
  }
}