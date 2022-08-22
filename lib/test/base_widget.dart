import 'package:flutter/material.dart';

class BaseWidgetDemo extends StatelessWidget {
  const BaseWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StackWidgetDemo();
  }
}

//stack Z轴
class StackWidgetDemo extends StatelessWidget {
  const StackWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            color: Colors.red,
            child: const Icon(
              Icons.add,
              size: 180,
            ),
          ),
        ),
        Positioned(
          child: Container(
            color: Colors.yellow,
            child: const Icon(
              Icons.ac_unit,
              size: 120,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Container(
            color: Colors.blue,
            child: const Icon(
              Icons.access_alarm,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}

//Container Row
class ContainerWidgetDemo extends StatelessWidget {
  const ContainerWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Container(
            color: Colors.green,
            margin: const EdgeInsets.all(10),
            child: const Icon(Icons.add),
          ),
          Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(10),
            child: const Icon(Icons.add),
          ),
          Container(
            color: Colors.grey,
            margin: const EdgeInsets.all(10),
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

//text widget
class TextWidgetDemo extends StatelessWidget {
  const TextWidgetDemo({Key? key}) : super(key: key);

  final TextStyle _textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.blue,
    backgroundColor: Colors.green,
  );
  final String _course = 'Flutter';
  final String _company = '谷歌';

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_course是<{$_company}>的移动UI框架',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'haha flutter!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
