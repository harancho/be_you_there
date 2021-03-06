import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:http/http.dart';

class BluetoothDevices extends StatefulWidget {
  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {

  // FlutterBeacon flutterBeacon;
  StreamSubscription<RangingResult> _streamRanging;
  List beacons_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFunction();
  }

  makePostRequest() async {

    String url = "https://byt-server.siddharthg123.repl.co/predict";
    Map<String, String> headers = {"Content-type": "application/json"};
    List available_beacon_uuid = beacons_list;
    // String json = '{"uuids" : $available_beacon_uuid}';

    Response response = await post(url, headers: headers, body: jsonEncode({'uuids' : available_beacon_uuid}));
    //int statusCode = response.statusCode;

    print(response.body);
  }

  void myFunction() async {
    try {
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
      print("error found");
      print(e);
      // library failed to initialize, check code and message
    }

    // final regions = <Region>[
    //   Region(identifier: null,proximityUUID: '00080f08-080f-77eb-4a35-b67f03739aac'),
    // ];

    final regions = <Region>[];
    regions.add(Region(identifier: null, proximityUUID: null));

    // regions.add(Region(proximityUUID: ''));


    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) async {
          // print(result);
          if (result.beacons.isNotEmpty) {
            beacons_list.removeRange(0, beacons_list.length);
            // print("------");
            // print(beacons_list.length);
            // print("------");
            for (var i = 0; i < result.beacons.length; i++) {
              beacons_list.add(result.beacons[i].proximityUUID);
            }
            print(beacons_list.length);
            // await makePostRequest();

            if(this.mounted) {
              setState(() {

              });
            }
            //beacons_list.add(result.beacons[0].proximityUUID.toString());
            // beacons_list.add(result);
            // print(result);
          }
          else
            {
              beacons_list.removeRange(0, beacons_list.length);
              setState(() {

              });
            }
          // beacons_list.add(result.toString());
        });

// to stop ranging beacons

    // Timer(Duration(seconds: 2),(){
    //   _streamRanging.cancel();
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Available Beacons"),
        ),
        body:
        ListView.builder(
          itemCount: beacons_list.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(beacons_list[index]),
              ),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     myFunction();
        //   },
        // ),
      ),
      onWillPop: () {
        _streamRanging.cancel();
        // ignore: missing_return
        Navigator.of(context).pop();
      },
    );
  }
}
