// ListWheelScrollView
//
// Widget of the Week #69
//
// https://youtu.be/dUhmWAz4C7Y
//


import 'package:flutter/material.dart';
import 'package:gdl_watermark/gdl_watermark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w069_listwheelscrollview/random_list_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Widget of the week #69'),
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
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10,),
            Text('ListWheelScrollView Sample',style: GoogleFonts.dMSans(fontSize: 25),),
            Container(
              height: 500,
              child: ListWheelScrollView(
                children: getWidgetItems(),
                itemExtent: 100,
              ),
            ),
            Spacer(),
            FlutterGdl.showBottomWatermark()
          ],
        ),
      ),
    );
  }

  Widget getCuteContainer(
      {String sampleText = 'Random Text', Size size = const Size(200, 200)}) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 3.0,
              offset: new Offset(0.0, 0.50))
        ],
      ),
      width: size.width,
      child: Center(child: Text("${sampleText.toString()}")),
    );
  }

  List<Widget> getWidgetItems() {
    List<Widget> items = List();

    randomLabel.forEach((item) {
      items.add(getCuteContainer(sampleText: item));
    });

    return items;
  }
}
