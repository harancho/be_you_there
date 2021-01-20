import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDevices extends StatefulWidget {
  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {

  @override
  Widget build(BuildContext context) {

    List list_1 = ['harsh','riti','ok'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Devices"),
      ),
      body:
      // ListView.builder(
      //   itemCount: list_1.length,
      //   itemBuilder: (context,index){
      //     return Card(
      //       child: ListTile(
      //         onTap: (){},
      //         title: Text(list_1[index]),
      //       ),
      //     );
      //   },
      // )
      RaisedButton(
        onPressed: (){

        },
        child: Text("OK"),
      )
    );
  }
}
