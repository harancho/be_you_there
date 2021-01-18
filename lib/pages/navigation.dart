import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  var i =0;

  var start_x_point = 6.0;
  var start_y_point = 47.0;

  var end_x_point = 106.0;
  var end_y_point = 16.0;

  var path_0 = [[106.0, 16.0], [105, 16], [104, 16], [103, 16], [102, 16], [101, 16], [100, 16], [99, 16], [98, 16], [97, 16], [96, 16], [95, 16], [94, 16], [93, 16], [92, 16], [91, 16], [90, 16], [89, 16], [88, 16], [87, 16], [86, 16], [85, 16], [84, 16], [83, 16], [82, 16], [81, 16], [80, 16], [79, 16], [78, 16], [77, 16], [76, 16], [75, 16], [74, 16], [73, 16], [72, 16], [71, 16], [70, 16], [69, 16], [68, 16], [67, 16], [66, 16], [65, 16], [64, 16], [63, 16], [62, 16], [61, 16], [60, 16], [59, 16], [58, 16], [57, 16], [56, 16], [55, 16], [54, 16], [53, 16], [52, 16], [51, 16], [50, 16], [49, 16], [49, 17], [49, 18], [49, 19], [49, 20], [49, 21], [49, 22], [49, 23], [49, 24], [49, 25], [49, 26], [49, 27], [49, 28], [49, 29], [49, 30], [49, 31], [49, 32], [49, 33], [49, 34], [49, 35], [49, 36], [49, 37], [49, 38], [49, 39], [49, 40], [49, 41], [49, 42], [49, 43], [49, 44], [49, 45], [49, 46], [49, 47], [49, 48], [49, 49], [49, 50], [48, 50], [47, 50], [46, 50], [46, 49], [46, 48], [46, 47], [45, 47], [44, 47], [43, 47], [42, 47], [41, 47], [40, 47], [39, 47], [38, 47], [37, 47], [36, 47], [35, 47], [34, 47], [33, 47], [32, 47], [31, 47], [30, 47], [29, 47], [28, 47], [27, 47], [26, 47], [25, 47], [24, 47], [23, 47], [22, 47], [21, 47], [20, 47], [19, 47], [18, 47], [17, 47], [16, 47], [15, 47], [14, 47], [13, 47], [12, 47], [11, 47], [10, 47], [9, 47], [8, 47], [7, 47], [6.0, 47.0]];                         // will include this when we will do final navigation

  @override
  Widget build(BuildContext context) {

    var index = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
        child: Stack(
          children: [
            Image(
              image: AssetImage("lib/images/floor_plan.png"),
              height: 300,
              width: 360,
            ),
            for(var index = 0 ; index< path_0.length ; index++)                //will include this when we will do final navigation
              Padding(
                padding: EdgeInsets.fromLTRB(path_0[index][0]*3.0, path_0[index][1]*3.0, 0, 0),
                //padding: EdgeInsets.fromLTRB(path[index][0]*3.0, path_y_list[index][1]*3.0, 0, 0),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.blue,
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(start_x_point*3.0, start_y_point*3.0, 0, 0),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(end_x_point*3.0, end_y_point*3.0, 0, 0),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
