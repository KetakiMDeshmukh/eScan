import 'package:e_scan/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EScan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EScan"),
        centerTitle: true,
      ),
        body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> listOfRecents = [ReusableCard(1)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: listOfRecents,
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@ required this.number});

  final int number ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Card pressed");
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white38,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      "NAME OF FILE",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "LOCATION OF FILE",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "NAME OF AUTHOR",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
