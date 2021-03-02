import 'package:be_you_there_final_project/pages/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/gen/flutterblue.pb.dart';
import 'package:flutter_blue/gen/flutterblue.pbserver.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
              title: Text("Navigation Simulation"),
              onTap: (){
                Navigator.pushNamed(context, "/navigation");
              },
            ),
            ListTile(
              title: Text("Available Beacons"),
              onTap: () async {

                if(await FlutterBlue.instance.isOn)
                  {
                    print("onn");
                    Navigator.pushNamed(context, "/bluetooth-devices");
                  }
                else
                  {
                    print("off");
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Bluetooth is off! Please turn it on"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: (){
                              Navigator.of(ctx).pop();
                            },
                          )
                        ],
                      ),
                    );
                  }
              },
            ),
            ListTile(
                title: Text("CSE Deployment"),
                onTap: () async {
                  // Navigator.pushNamed(context, '/CSE-Deployment');

                  if(await FlutterBlue.instance.isOn)
                  {
                    print("onn");
                    Navigator.pushNamed(context, "/CSE-Deployment");
                  }
                  else
                  {
                    print("off");
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Bluetooth is off! Please turn it on"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: (){
                              Navigator.of(ctx).pop();
                            },
                          )
                        ],
                      ),
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
