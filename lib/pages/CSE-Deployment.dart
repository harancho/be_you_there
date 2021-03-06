import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:http/http.dart';

class CseDeployment extends StatefulWidget {
  @override
  _CseDeploymentState createState() => _CseDeploymentState();
}

class _CseDeploymentState extends State<CseDeployment> {

  StreamSubscription<RangingResult> _streamRanging;
  List beacons_list = [];
  List beacon_uuid = ['00080F08-08EB-2B7E-B52C-66FFA7268E7E','00080F08-08CF-77EB-4A35-B67F03739AAC','00080F08-0845-3A95-FA5B-F6EDFDBE3532','53594F4F-4B53-4146-4551-524E54414754','53594F4F-4B53-4146-4551-524E54414753'];
  List beacon_list_x_coordinate = [7.32,16.32,25.32,34.32,43.32];  //36:Ac 1st      //36:C5  2nd      //36:A1 3rd
  List beacon_list_y_coordinate = [16.34,16.34,16.34,16.34,16.34];

  List active_x_coordinate = [];
  List active_y_coordinate = [];

  List path = [];

  List destination = [0,0];

  //added this extra part in http call to coordinate with list of current_available_beacons and position predicted
  List active_x_c = [];
  List active_y_c = [];

  var predicted_x;
  var predicted_y;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFunction();
  }

  makePostRequest(List active_x,List active_y) async {

    String url = "https://byt-server.siddharthg123.repl.co/predict";
    Map<String, String> headers = {"Content-type": "application/json"};
    List available_beacon_uuid = beacons_list;
    //added this extra part in http call to coordinate with list of current_available_beacons and position predicted
    Response response = await post(url, headers: headers, body: jsonEncode({'uuids' : available_beacon_uuid,'x': active_x,'y': active_y}));

    // print(response.body);
    final decoded = jsonDecode(response.body) as Map;
    predicted_x = decoded['position'][0];
    predicted_y = decoded['position'][1];

    //added this extra part in http call to coordinate with list of current_available_beacons and position predicted
    active_x_c = decoded['active_x'];
    active_y_c = decoded['active_y'];
    path = decoded['path'];
    print(path);
    destination = decoded['end'];
    print(destination);
    // print(active_y_c.length);

    //receive destination coordinates here and path to reach there in last step


    //
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
            active_y_coordinate.removeRange(0, active_y_coordinate.length);
            active_x_coordinate.removeRange(0, active_x_coordinate.length);
            // print("------");
            // print(beacons_list.length);
            // print("------");
            for (var i = 0; i < result.beacons.length; i++) {
              beacons_list.add(result.beacons[i].proximityUUID);
            }

            for (var i = 0;i< beacons_list.length;i++) {
              if (beacon_uuid[0] == beacons_list[i]){
                active_x_coordinate.add(beacon_list_x_coordinate[0]);
                active_y_coordinate.add(beacon_list_y_coordinate[0]);
              }

              if (beacon_uuid[1] == beacons_list[i]){
                active_x_coordinate.add(beacon_list_x_coordinate[1]);
                active_y_coordinate.add(beacon_list_y_coordinate[1]);
              }

              if (beacon_uuid[2] == beacons_list[i]){
                active_x_coordinate.add(beacon_list_x_coordinate[2]);
                active_y_coordinate.add(beacon_list_y_coordinate[2]);
              }

              if(beacon_uuid[3] == beacons_list[i]){
                active_x_coordinate.add(beacon_list_x_coordinate[3]);
                active_y_coordinate.add(beacon_list_y_coordinate[3]);
              }

              if(beacon_uuid[4] == beacons_list[i]){
                active_x_coordinate.add(beacon_list_x_coordinate[4]);
                active_y_coordinate.add(beacon_list_y_coordinate[4]);
              }
            }
            await makePostRequest(active_x_coordinate,active_y_coordinate);

            if(this.mounted) {
              setState(() {

              });
            }
          }
          else {
            active_x_coordinate.removeRange(0, active_x_coordinate.length);
            active_y_coordinate.removeRange(0, active_y_coordinate.length);
            beacons_list.removeRange(0, beacons_list.length);
            setState(() {

            });
          }
        });
  }
  @override
  Widget build(BuildContext context) {

    var beacon_x_coordinate = [52.32,43.32,44.36,44.36,44.36,42.06,42.06,37.56,24.43,19.93,15.43,10.73,6.43,19.53,19.53,12.18,12.18,18.53,19.53,15.12,7.32,16.32,25.32,34.32,30.93];
    var beacon_y_coordinate = [16.34,16.34,17.9,22.4,26.9,31.6,40.6,39.39,40.49,40.49,40.49,40.49,40.49,39.46,33.41,31.32,26.82,26.82,24.41,20.84,16.34,16.34,16.34,16.34,40.49];

    // var beacon_x_coordinate = [7.320,19.53,44.36,55.50,44.36,42.06,42.06,19.53,37.56,37.56,35.00,35.00,19.53,6.430,12.18,12.18,19.53];
    // var beacon_y_coordinate = [16.34,16.34,16.34,16.34,30.00,30.00,40.60,26.82,40.60,39.00,39.00,40.49,40.49,40.49,26.82,34.50,34.50];

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CSE Deployment"),
        ),
        body: Center(
          child: Stack(
            children: [
              Image(
                image: AssetImage("lib/images/img-1.jpg"),
                height: 56.6 * 6.0,
                width: 62.6 * 6.0,
              ),
              // for(var index = 0 ; index< beacon_x_coordinate.length ; index++)                //will include this when we will do final navigation
              //   Padding(
              //     padding: EdgeInsets.fromLTRB(beacon_x_coordinate[index]*6.0, beacon_y_coordinate[index]*6.0, 0, 0),
              //     //padding: EdgeInsets.fromLTRB(path[index][0]*3.0, path_y_list[index][1]*3.0, 0, 0),
              //     child: Icon(
              //       Icons.circle,
              //       size: 7,
              //       color: Colors.blue,
              //     ),
              //   ),
              for(var index = 0;index<path.length;index++)
                Padding(
                  padding: EdgeInsets.fromLTRB(path[index][0] * (6.0/5.0), path[index][1] * (6.0/5.0),0, 0),
                  child: Icon(
                    Icons.circle,
                    size: 7,
                    color: Colors.blue,
                  ),
                ),
              for (var  index = 0; index< active_x_c.length ; index++)
                Padding(
                  padding: EdgeInsets.fromLTRB(active_x_c[index]*6.0, active_y_c[index]*6.0, 0, 0),
                  child: Icon(
                    Icons.circle,
                    size: 7,
                    color: Colors.red,
                  ),
                ),

              if (predicted_x != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(predicted_x * 6, predicted_y * 6.0, 0, 0),
                  child: Icon(
                    Icons.circle,
                    size: 7,
                    color: Colors.black,
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(destination[0] * (6.0/5.0), destination[1] * (6.0/5.0), 0, 0),
                child: Icon(
                  Icons.circle,
                  size: 7,
                  color: Colors.black,
                ),
              ),



              //add 1 if condition to display destination point
              //add 1 for loop to display the path from current_position to destination


              //
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

            // print(beacons_list);
            // await makePostRequest(active_x_coordinate,active_y_coordinate);
            // if(this.mounted) {
            //   setState(() {
            //
            //   });
            // }

          },
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.edit_location,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      onWillPop: () {
        _streamRanging.cancel();
        // ignore: missing_return
        Navigator.of(context).pop();
      },
    );
  }
}
