import 'package:flutter/material.dart';
import 'time_line_view.dart';

class TimeLineController extends StatefulWidget {
  final String title;
  const TimeLineController({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TimeLineWidget();
  }
}

// ignore: camel_case_types
class TimeLineWidget extends State<TimeLineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: TimelineView(title: widget.title),
    );
  }
}
