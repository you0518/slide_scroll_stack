import 'package:flutter/material.dart';
import 'package:slide_scroll_stack/slide_scroll_stack.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: SlideScrollStack(
          rate: 1 / 2,
          slideDirection: SlideDirection.left,
          children: <Widget>[
            Card(
              child: FlutterLogo(
                colors: Colors.blue,
              ),
            ),
            Card(
              child: FlutterLogo(
                colors: Colors.red,
              ),
            ),
            Card(
              child: FlutterLogo(
                colors: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ));
