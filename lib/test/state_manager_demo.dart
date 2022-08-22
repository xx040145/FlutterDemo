import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  const StateManagerDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SmdState();
  }
}

class SmdState extends State<StateManagerDemo> {
  int count = 0;

  void buttonClick() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagerDemo'),
      ),
      body: Center(
        child: Chip(
          label: Text('点击次数 = $count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: buttonClick,
      ),
    );
  }
}
