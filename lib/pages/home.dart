import 'package:be_you_there_final_project/pages/navigation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Username"),
                accountEmail: Text("abc@gmail.com"),
              currentAccountPicture: Icon(Icons.account_circle_rounded, size: 70,),
            ),
            ListTile(
              title: Text("Tracing Accuracy"),
              onTap: (){
                Navigator.pushNamed(context, '/tracing');
              }
            ),
            ListTile(
              title: Text("Shortest Path"),
              onTap: (){
                print("HI");
                Navigator.pushNamed(context, "/navigation");
              },
            ),
            ListTile(
              title: Text("Bluetooth Device Scan"),
              onTap: (){
                print("hi");
                // flutterBlue.startScan(timeout: Duration(seconds: 4));
                //
                // var subscription = flutterBlue.scanResults.listen((results) {
                //   for (ScanResult r in results) {
                //     print('${r.device.name} found! rssi: ${r.rssi}');
                //   }
                // });
                //
                // flutterBlue.stopScan();
                // print(subscription);
              },
            )
          ],
        ),
      ),
    );
  }
}
