// Expanded
//
// Widget of the Week #2
//
// https://youtu.be/_rnZaagadyo
//

import 'package:flutter/material.dart';
import 'package:gdl_watermark/gdl_watermark.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Widget of The Week #2'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: GoogleFonts.dMSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2, // <--- cambiar el '2' aqui
                child: Text('Expanded Sample')),
            Expanded(
                child: Text(
                    'Turn on the \'debug paint menu\' on the flutter debugger')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Text(
                  'Hello',
                ),
                Expanded(
                  flex: 1, // <--- cambiar el '1' aqui
                  child: Container(
                    color: Colors.green,
                    child: SizedBox(
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3, // <--- cambiar el '3' aqui
                  child: Text(
                    'World',
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 2, // <--- cambiar el '2'aqui
                child: SizedBox(
                  height: 100,
                )),
            FlutterGdl.showBottomWatermark(),
          ],
        ),
      ),
    );
  }
}
