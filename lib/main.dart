import 'package:flutter/material.dart';
import 'package:task_list/Screen/top_bar.dart';
import 'package:provider/provider.dart';
import 'package:task_list/widget/listView.dart';
import 'widget/floatingButtonShopping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BodyBuilder()),
        ChangeNotifierProvider.value(value: Fbloating())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Color(0xFFFFD600)),
        home: TopBar(),
      ),
    );
  }
}
