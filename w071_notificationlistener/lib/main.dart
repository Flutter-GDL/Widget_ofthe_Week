// ShaderMask
//
// Widget of the Week #71
//
// https://youtu.be/cAnFbFoGM50
//


import 'package:flutter/material.dart';
import 'package:gdl_watermark/gdl_watermark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w071_notificationlistener/notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Widget of The Week #71'),
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
  String todayText = "";
  String listStatus = "";

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(
                'NotificationListener Sample',
                style: GoogleFonts.dMSans(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Spacer(
                flex: 1,
              ),
              NotificationListener<TodayNotification>(
                  onNotification: (notification) {
                    setState(() {
                      todayText = notification.time;
                    });

                    return true;
                  },
                  child: Today()),
              Text("$todayText"),
              Spacer(
                flex: 1,
              ),
              Text('La lista abajo es \'scrollable\'',
                  style: TextStyle(fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid
                  )),
              listViewSample(),
              Spacer(),
              Text("$listStatus"),
              Spacer(
                flex: 2,
              ),
              FlutterGdl.showBottomWatermark()
            ],
          ),
        ));
  }

  Widget listViewSample() {
    return Container(
      height: 100,
      width: 200,
      child: NotificationListener<ScrollNotification>(
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              'Item $index',
              textAlign: TextAlign.center,
            );
          },
        ),
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            setState(() {
              listStatus = "Haz llegado al fin de la lista!";
            });
          } else if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.minScrollExtent) {
            setState(() {
              listStatus = "Haz llegado al principio de la lista!";
            });
          } else {
            setState(() {
              listStatus = "";
            });
          }
          return true;
        },
      ),
    );
  }
}
