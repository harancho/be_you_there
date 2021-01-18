import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: HexColor("#00AEC6"),
      // appBar: AppBar(
      //   title: Text("Register Page"),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image(
                  image: AssetImage("lib/images/logo_2.png"),
                  height: 300,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    filled: true,
                    fillColor: HexColor("#00454F"),
                    hintText: "Username",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hoverColor: Colors.red,
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      size: 25,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: HexColor("#00454F"),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hoverColor: Colors.red,
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      size: 25,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: HexColor("#00454F"),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,50,0,0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){

                      // functionality for register button
                      Navigator.popAndPushNamed(context, '/login');

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    textColor: Colors.white,
                    color: HexColor("#00454F"),
                    child: Text(
                        "Register",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,30),
                child: InkWell(
                  onTap: (){
                    Navigator.popAndPushNamed(context, "/login");
                  },
                  child: Text(
                      "Sign In!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
