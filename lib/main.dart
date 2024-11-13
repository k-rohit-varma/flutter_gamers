
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/registergame.dart';

import 'home.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gamers",
      debugShowCheckedModeBanner: false,
      home: registergame(),
    );

  }
}