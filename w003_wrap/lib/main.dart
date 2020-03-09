// Wrap
//
// Widget of the Week #3
//
// https://youtu.be/z5iw2SeFx2M
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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Samples Guadalajara'),
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
  List<Widget> items = List();
  bool horizontal = true;
  String status = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Container(
              height: 200,
              child: Wrap(
                direction:
                    (horizontal == true) ? Axis.horizontal : Axis.vertical,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: items,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    addItem();
                  },
                  child: Text("Add Item"),
                ),
                OutlineButton(
                  onPressed: () {
                    removeItem();
                  },
                  child: Text("Remove Item"),
                ),
              ],
            ),
            OutlineButton(
              onPressed: () {
                changeAxis();
              },
              child: Text("Change Axis"),
            ),
            Spacer(),
            Text("$status"),
            Spacer(),
            FlutterGdl.showBottomWatermark()
          ],
        ),
      ),
    );
  }

  void changeAxis() {
    setState(() {
      horizontal = !horizontal;
    });
  }

  void addItem() {
    // remove this and the layout will overflow!
    if (items.length > 7) {
      setState(() {
        status = "Max 8 items in this sample";
      });
      return;
    }

    setState(() {
      status = "";
      items.add(getSampleItem());
    });
  }

  void removeItem() {
    if (items.length == 0) return;

    setState(() {
      status = "";
      items.removeLast();
    });
  }

  Widget getSampleItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          width: 50,
          color: Colors.green,
          child: SizedBox(height: 10, width: 10)),
    );
  }
}
