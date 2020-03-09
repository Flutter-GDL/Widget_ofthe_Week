// Safe Area
//
// Widget of the Week #1
//
// https://youtu.be/lkF0TQJO0bA
//
import 'package:flutter/material.dart';
import 'package:gdl_watermark/gdl_watermark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Widget of The Week #1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This is a Private Variable because of the '_' 
  bool _safeAreaOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _safeAreaOn == true
          ? SafeArea(
              child: showContents(),
            )
          : showContents(),
    );
  }

  Widget showContents() {
    return Container(
      color: Colors.lime,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Top Border"),
          Spacer(),
          Text("Widget of The Week #1"),
          OutlineButton(
              onPressed: () {
                setState(() {
                  _safeAreaOn = !_safeAreaOn;
                });
              },
              child: Text(_safeAreaOn == true
                  ? 'Disable Safe Area'
                  : 'Enable Safe Area')),
          Spacer(),
          FlutterGdl.showBottomWatermark(),
          Text(
            'Bottom Border',
          ),
        ],
      ),
    );
  }
}
