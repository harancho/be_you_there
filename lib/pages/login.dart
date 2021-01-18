import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                padding: EdgeInsets.fromLTRB(30, 90, 30, 0),
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
                padding: const EdgeInsets.fromLTRB(0,60,0,0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){

                      // functionality for login button
                      Navigator.popAndPushNamed(context, '/home');

                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    textColor: Colors.white,
                    color: HexColor("#00454F"),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,0),
                child: InkWell(
                  onTap: (){


                    // functionality for forgot password button

                  },
                  child: Text(
                    "Forgot Password!",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,30),
                child: InkWell(
                  onTap: (){
                    Navigator.popAndPushNamed(context, "/register");
                  },
                  child: Text(
                    "Sign Up!",
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
