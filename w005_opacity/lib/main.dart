// Opacity
//
// Widget of the Week #5
//
// https://youtu.be/9hltevOHQBw
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
  double opacity = 1.0;
  double animatedOpacity = 1.0;

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
            Text(
              'Opacity Sample',
              style: GoogleFonts.dMSans(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            topSample(),
            SizedBox(height: 220),
            bottomSample(),
            Spacer(),
            FlutterGdl.showBottomWatermark()
          ],
        ),
      ),
    );
  }


  Column topSample() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("One"),
            Opacity(opacity: opacity, child: Text("Two")),
            Text("Three"),
          ],
        ),
        SizedBox(height: 20),
        OutlineButton(
          onPressed: () {
            setState(() {
              opacity = 0.0;
            });
          },
          child: Text("Hide Item"),
        ),
        SizedBox(height: 10),
        OutlineButton(
          onPressed: () {
            setState(() {
              opacity = 1.0;
            });
          },
          child: Text("Show Item"),
        ),
      ],
    );
  }

  Column bottomSample() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("One"),
            // Nota:
            // Usar opacity para esconder widgets no es la mejor solucion
            // ya que interaccion todavia es posible
            AnimatedOpacity(
                duration: Duration(milliseconds: 450),
                opacity: animatedOpacity,
                child: OutlineButton(
                  onPressed: (){
                    // cuidado: todavia funciona!
                    debugPrint('caution: still works!');
                  },
                  child: Text("Tap when hidden"))),
            Text("Three"),
          ],
        ),
        OutlineButton(
          onPressed: () {
            setState(() {
              animatedOpacity = 0.0;
            });
          },
          child: Text("Hide Item (Animation)"),
        ),
        SizedBox(height: 10),
        OutlineButton(
          onPressed: () {
            setState(() {
              animatedOpacity = 1.0;
            });
          },
          child: Text("Show Item (Animation)"),
        ),
      ],
    );
  }


}
