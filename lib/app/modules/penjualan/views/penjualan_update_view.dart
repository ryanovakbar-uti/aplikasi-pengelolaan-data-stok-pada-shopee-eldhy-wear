import 'package:bcdx_21312020/app/utils/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penjualan_controller.dart';

class PenjualanUpdateView extends GetView<PenjualanController> {
  PenjualanUpdateView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah Data Penjualan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNamaPembeli.text = data['nama_pembeli'];
            controller.cNamaBarang.text = data['nama_barang'];
            controller.cJumlahBarang.text = data['jumlah_barang'];
            controller.cUpdateJumlahBarang.text = data['jumlah_barang'];
            controller.cHargaBarang.text = data['harga_barang'];

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Eldhy Wear',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade900,
                      ),
                    ),
                      
                    SizedBox(height: 30.0),
                      
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(45.0),
                      ),
                      child: Image.asset(
                        'lib/assets/Eldhy_Wear.jpeg',
                        height: 180.0,
                      ),
                    ),
              
                    SizedBox(height: 50.0),
                    
                    MyTextField(
                      myController: controller.cNamaPembeli,
                      myReadOnly: false,
                      myLabelText: 'Nama Pembeli',
                      myObscureText: false,
                    ),
                    
                    SizedBox(
                      height: 10,
                    ),

                    MyTextField(
                      myController: controller.cNamaBarang,
                      myReadOnly: true,
                      myLabelText: 'Nama Barang (Read Only)',
                      myObscureText: false,
                    ),
                    
                    SizedBox(
                      height: 10,
                    ),
                    
                    MyTextField(
                      myController: controller.cUpdateJumlahBarang,
                      myReadOnly: false,
                      myLabelText: 'Jumlah Barang',
                      myObscureText: false,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),
                    
                    MyTextField(
                      myController: controller.cHargaBarang,
                      myReadOnly: false,
                      myLabelText: 'Harga Barang',
                      myObscureText: false,
                    ),
                    
                    SizedBox(
                      height: 30,
                    ),
                    
                    ElevatedButton(
                      onPressed: () => controller.Update(
                        controller.cNamaPembeli.text,
                        controller.cNamaBarang.text,
                        controller.cUpdateJumlahBarang.text,
                        controller.cHargaBarang.text,
                        Get.arguments,
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                      child: Text(
                        'Simpan',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
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