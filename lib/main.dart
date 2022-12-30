import 'package:flutter/material.dart';
import 'package:myapp/SCREANS/nalan.dart';
import 'package:petgoapp/screens/todolist.dart';

import 'screens/counter.dart';
import 'screens/.dart';
import 'screens/toplama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: '202015-Ahmet-Cengiz',
      theme: ThemeData(primarySwatch: colors.red),
      home: const Nalan(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Sayac mySayac, widget) => Scaffold(
        appBar: AppBar(
          title: Text("202015-Ahmet Cengiz"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sayaç değeri: " + mySayac.sayac.toString()),
              RaisedButton(
                color: Colors.red,
                child: Text("Sayacı arttır!"),
                onPressed: () {
                  mySayac.arttir();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
