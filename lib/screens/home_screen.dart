import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Client NodeJs'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                child: Text(
                  'Send request to server',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  _makeGetRequest();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  serverResponse,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //função que envia uma requisição
  _makeGetRequest() async {
    http.Response response = await http.get(_localhost());
    setState(() {
      serverResponse = response.body;
    });
  }

  //server host node get
  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000';
    else //for ios simulator
      return 'http://localhost:3000';
  }
}
