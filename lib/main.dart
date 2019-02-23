import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';
import 'package:sms/sms.dart';

void main() {
  HttpServer
      .bind(InternetAddress.anyIPv6, 4444).then((server) {
        server.listen((HttpRequest request) {
        if (request.method == 'GET') {
          var queryParams = request.requestedUri.queryParameters;
          if (queryParams.containsKey("body") && queryParams.containsKey("num")) {
            SmsSender sender = new SmsSender();
            SmsMessage message = new SmsMessage("+" + queryParams["num"], queryParams["body"]);
            sender.sendSms(message);
            request.response.write('ok');
          } else {
            request.response.write("Invalid request: must contain body and num");
          }
        } else {
          request.response.write(request.method + ': Method not allowed');
        }
        request.response.close();
        });
      });
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Wifi',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _wifiName = 'click button to get wifi ssi.';
  int level = 0;
  String _ip = 'click button to get ip.';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_ip),
        centerTitle: true,
      ),
      body: RaisedButton(
        child: Text('Get IP'),
        onPressed: _getIP,
      ),
    );
  }


  Future<Null> _getIP() async {
    String ip = await Wifi.ip;
    setState(() {
      _ip = ip + ':4444';
    });
  }

}