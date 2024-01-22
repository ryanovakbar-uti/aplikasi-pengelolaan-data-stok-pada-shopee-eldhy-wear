import 'package:bcdx_21312020/app/utils/my_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penjualan_controller.dart';

class PenjualanAddView extends GetView<PenjualanController> {
  PenjualanAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.cNamaPembeli.clear();
    controller.cNamaBarang.clear();
    controller.cJumlahBarang.clear();
    controller.cUpdateJumlahBarang.clear();
    controller.cHargaBarang.clear();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Data Penjualan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      
      body: Center(
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
        
              DropdownButtonFormField<String>(
                value: controller.cNamaBarang.text.isNotEmpty ? controller.cNamaBarang.text : null,
                onChanged: (String? newValue) {
                  controller.cNamaBarang.text = newValue ?? '';
                },
                items: <String>[
                  'Kemeja Alisan Panjang Slim Fit Putih',
                  'Celana Training Panjang Reseleting Saku',
                  'CD Celana Dalam Crocodile 521-262',
                  'Handuk Gucci 70 x 140 cm',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                ),
              ),
        
              SizedBox(
                height: 10,
              ),
        
              MyTextField(
                myController: controller.cJumlahBarang,
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
                onPressed: () => controller.add(
                  controller.cNamaPembeli.text,
                  controller.cNamaBarang.text,
                  controller.cJumlahBarang.text,
                  controller.cHargaBarang.text,
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
      ),
    );
  }
}