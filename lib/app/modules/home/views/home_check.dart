import 'package:bcdx_21312020/app/modules/penjualan/views/penjualan_add_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

homeCheck(String title) {
  if (title == 'Data Penjualan') {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.amber,
      titleSpacing: 0,
      title: Text(
        'Data Penjualan',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(PenjualanAddView()),
          icon: Icon(Icons.add_circle_outline),
        )
      ],
    );
  } else {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.amber,
      titleSpacing: 0,
      title: Text(
        'Data Stok Barang',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}