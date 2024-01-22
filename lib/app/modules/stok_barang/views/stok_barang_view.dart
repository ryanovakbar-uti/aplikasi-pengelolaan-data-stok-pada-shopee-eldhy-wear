import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stok_barang_controller.dart';

class StokBarangView extends GetView<StokBarangController> {
  StokBarangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: StreamBuilder<QuerySnapshot<Object?>>(
        stream: Get.put(StokBarangController()).streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.length > 0
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                        title: Text(
                          '${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}'
                        ),
                        subtitle: Text(
                          'Jumlah Barang: ${(listAllDocs[index].data() as Map<String, dynamic>)['jumlah_barang']}'
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text('Data Kosong'),
                  );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}