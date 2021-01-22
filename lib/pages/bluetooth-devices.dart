import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDevices extends StatefulWidget {
  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {

  // FlutterBeacon flutterBeacon;
  StreamSubscription<RangingResult> _streamRanging;
  List beacons_list = ['start'];
  final _regionBeacons = <Region, List<Beacon>>{};
  final _beacons = <Beacon>[];

  void myFunction() async {

    try {
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch(e) {
      print("error found");
      print(e);
      // library failed to initialize, check code and message
    }

    // final regions = <Region>[
    //   Region(identifier: null,proximityUUID: '00080f08-080f-77eb-4a35-b67f03739aac'),
    // ];

    final regions = <Region>[];
    regions.add(Region(identifier: null,proximityUUID: '00080f08-080f-77eb-4a35-b67f03739aac'));

    // regions.add(Region(proximityUUID: ''));


    _streamRanging = flutterBeacon.ranging(regions).listen((RangingResult result) {
      print(result);
      if(result.beacons.isNotEmpty)
        {
          print(result.beacons);
          beacons_list.add(result.toString());
        }
      // beacons_list.add(result.toString());
    });

// to stop ranging beacons

    Timer(Duration(seconds: 10),(){
      _streamRanging.cancel();
      beacons_list.add("end");
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //List list_1 = ['harsh','riti','ok'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Actual Deployment"),
      ),
      body:
      ListView.builder(
        itemCount: beacons_list.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(beacons_list[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          myFunction();
        },
      ),
    );
  }
}
