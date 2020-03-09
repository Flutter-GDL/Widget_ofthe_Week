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
  Color containerColor = Colors.red;
  Color containerBorderColor = Colors.white;

  Size rectangle = Size(200, 200);
  String title = "Normal";
  double radius = 0.0;
  double borderWidth = 1.0;

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
              'AnimatedContainer\nSample',
              style: GoogleFonts.dMSans(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            AnimatedContainer(
              width: rectangle.width,
              height: rectangle.height,
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(width: borderWidth,color: containerBorderColor),
                color: containerColor,
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 50),
            OutlineButton(
              onPressed: () {
                setState(() {
                  containerColor = Colors.green;
                  rectangle = Size(100, 100);
                  title = "Animated";
                  radius = 20;
                  borderWidth = 5.0;
                  containerBorderColor = Colors.black;
                });
              },
              child: Text("Animate"),
            ),
            SizedBox(height: 10),
            OutlineButton(
              onPressed: () {
                setState(() {
                  containerColor = Colors.red;
                  rectangle = Size(200, 200);
                  title = "Original";
                  radius = 0;
                  borderWidth = 0.0;
                  containerBorderColor = Colors.white;
                });
              },
              child: Text("Reset"),
            ),
            Spacer(),
            FlutterGdl.showBottomWatermark()
          ],
        ),
      ),
    );
  }
}
