import 'dart:async';

import 'package:flutter/material.dart';

class Tracing extends StatefulWidget {
  @override
  _TracingState createState() => _TracingState();
}

class _TracingState extends State<Tracing> {

  var i =0;

  @override
  Widget build(BuildContext context) {

    // Timer(Duration(seconds: 1),(){
    //   setState(() {
    //     i = i+1;
    //     if(i==22)
    //     {
    //       i =0;
    //     }
    //   });
    // });

    var actual_x_list = [0, 10, 20, 30, 40, 40, 50, 60, 70, 80, 90, 100, 110, 76.59, 76.59, 76.59, 76.59, 76.59, 76.59, 86, 96, 106];
    var actual_y_list = [47.11 , 47.11, 47.11, 47.11, 47.11, 56.11, 58, 58, 58, 58, 58, 58, 58, 58, 48, 38, 28, 18, 14.87, 14.87, 14.87, 14.87];

    var predicted_x_list = [5.98, 7.815, 21.033, 29.813, 38.937, 39.405, 50.143, 58.183, 70.001, 82.845, 88.421, 101.299, 109.663, 77.329, 77.72, 76.944, 77.264, 77.531, 77.915, 85.721, 95.959, 106.369];
    var predicted_y_list = [46.83 ,47.015 ,46.828 ,46.751 ,48.436 ,54.634 ,56.678 ,58.269 ,56.175 ,56.094 ,56.097 ,56.295 ,57.072 ,56.849 ,47.334 ,38.217 ,28.006 ,19.453 ,16.207 ,15.666 ,15.634 ,15.922];

    return Scaffold(
      appBar: AppBar(
        title: Text("Tracing"),
      ),
      body: Center(
        child: Stack(
          children: [
            Image(
              image: AssetImage("lib/images/floor_plan.png"),
              height: 300,
              width: 360,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(predicted_x_list[i]*3.0, predicted_y_list[i]*3.0, 0, 0),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(actual_x_list[i]*3.0, actual_y_list[i]*3.0, 0, 0),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.blue,
              ),
            ),
            // for(var name in random_y_list)                will include this when we will do final navigation
            //   Padding(
            //     padding: EdgeInsets.fromLTRB(name, 0, 0, 0),
            //     child: Icon(
            //       Icons.circle,
            //       size: 10,
            //       color: Colors.green,
            //     ),
            //   ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            i = i+1;
            if(i==22)
            {
              i =0;
            }
          });
        },
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.edit_location,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
