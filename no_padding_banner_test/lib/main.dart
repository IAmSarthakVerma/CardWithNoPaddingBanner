import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Banner Test'),
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
  List<LineMetrics> lines;
  TextPainter textPainter;
  double fontSize = 26;
  String bannerText =
      "This is a Banner. It is so cool. Now lets dive in and try it out. ";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int headerLineNumber = 0;
    double completeLineHeight = 0;

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.55,
        margin: EdgeInsets.only(
          top: screenHeight * 0.2,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(36.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black26, blurRadius: 50, spreadRadius: 5)
          ],
        ),
        child: LayoutBuilder(builder: (context, size) {
          final span1 = TextSpan(
            text: bannerText,
            style: TextStyle(
              backgroundColor: Colors.redAccent,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
          final tp = TextPainter(text: span1, textDirection: TextDirection.ltr);
          tp.layout(
            maxWidth: size.maxWidth,
          );

          headerLineNumber = tp.computeLineMetrics().last.lineNumber + 1;
          completeLineHeight = tp.computeLineMetrics().last.height;
          print(headerLineNumber);
          print(tp.computeLineMetrics());

          return Stack(children: [
            Container(
              child: RichText(
                text: TextSpan(
                  text: bannerText,
                  style: TextStyle(
                    backgroundColor: Colors.redAccent,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: " " +
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                        style: TextStyle(
                          backgroundColor: Colors.white,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1.1, -1.0),
              child: Container(
                width: 16.0 + 1.0,
                height: completeLineHeight * headerLineNumber,
                color: Colors.redAccent,
              ),
            )
          ]);
        }),
      ),
    );
  }
}
