import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  _ActionState createState() => _ActionState();
}

class _ActionState extends State<ActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Actions Screen'),
      ),
    );
  }
}
