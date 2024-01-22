import 'package:bcdx_21312020/app/utils/rupiah_currency.dart';
import 'package:bcdx_21312020/app/utils/total_harga.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penjualan_controller.dart';
import 'penjualan_update_view.dart';

class PenjualanView extends GetView<PenjualanController> {
  void showOption(id) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                PenjualanUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: StreamBuilder<QuerySnapshot<Object?>>(
        stream: Get.put(PenjualanController()).streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.length > 0
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                        child: CircleAvatar(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                      ),
                      title: Text(
                        'Nama Pembeli: ${(listAllDocs[index].data() as Map<String, dynamic>)['nama_pembeli'].split(' ')[0]}'
                      ),
                      subtitle: Text(
                        'Nama Barang: ${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}\n'
                        'Jumlah Barang: ${(listAllDocs[index].data() as Map<String, dynamic>)['jumlah_barang']}\n'
                        'Harga Barang: ${rupiahCurrency((listAllDocs[index].data() as Map<String, dynamic>)['harga_barang'])}\n'
                        'Total Bayar: ${totalBayar((listAllDocs[index].data() as Map<String, dynamic>)['jumlah_barang'], (listAllDocs[index].data() as Map<String, dynamic>)['harga_barang'])}\n'
                      ),
                      trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: Icon(Icons.more_vert),
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