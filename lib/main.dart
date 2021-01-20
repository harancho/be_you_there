import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/register.dart';
import 'pages/login.dart';
import 'pages/tracing.dart';
import 'pages/navigation.dart';
import 'pages/bluetooth-devices.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/register',
    routes: {
      '/register' : (context) => Register(),
      '/login' : (context) => Login(),
      '/home' : (context) => Home(),
      '/tracing' : (context) => Tracing(),
      '/navigation' : (context) => Navigation(),
      '/bluetooth-devices' : (context) => BluetoothDevices()
    },
  ));
}
