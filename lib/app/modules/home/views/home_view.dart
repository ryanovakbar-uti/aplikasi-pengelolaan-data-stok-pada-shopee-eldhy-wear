import 'package:bcdx_21312020/app/controllers/auth_controller.dart';
import 'package:bcdx_21312020/app/modules/home/views/home_check.dart';
import 'package:bcdx_21312020/app/modules/penjualan/views/penjualan_add_view.dart';
import 'package:bcdx_21312020/app/modules/penjualan/views/penjualan_view.dart';
import 'package:bcdx_21312020/app/modules/stok_barang/views/stok_barang_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Data Penjualan',
      'view': PenjualanView(),
      'add': PenjualanAddView(),
    },
    {
      'title': 'Data Stok Barang',
      'view': StokBarangView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: homeCheck(_fragment[_index]['title']),
      body: _fragment[_index]['view'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.black,
        selectedFontSize: 14.0,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14.0,

        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() => _index = 0);
              },
            ),
            label: 'Data Penjualan',
          ),

          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.data_object,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() => _index = 1);
              },
            ),
            label: 'Data Stok Barang',
          ),
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.black,
                ),

                Text(
                  'Eldhy Wear',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                SizedBox(
                  height: 2,
                ),

                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ),

          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DASHBOARD',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),

                SizedBox(height: 50.0),
                
                Text(
                  'Email:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${FirebaseAuth.instance.currentUser!.email}'),

                SizedBox(height: 40.0),
              ],
            ),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),

          ListTile(
            onTap: () {
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
