import 'package:flutter/material.dart';
import '../const.dart';

class FriendsIndexBarView extends StatefulWidget {
  final void Function(String str) indexBarCallBlock;

  const FriendsIndexBarView({Key? key, required this.indexBarCallBlock})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FriendsIndexBar();
  }
}

class FriendsIndexBar extends State<FriendsIndexBarView> {
  final indexWords = [];
  var _currentIndexStr = '';
  Color _backgroundColor = Colors.transparent;
  Color _textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    indexWords.add('🔍');
    for (int i = 0; i < 26; i++) {
      var string = String.fromCharCode(i + 65);
      indexWords.add(string);
    }
    indexWords.add('#');
  }

  // 右侧点击事件
  void dragDown(details) {
    _currentIndexStr = getIndexLetter(context, details.globalPosition)!;
    widget.indexBarCallBlock(_currentIndexStr);
    // if (_currentIndexStr != getIndexLetter(context, details.globalPosition)!) {
    //   _currentIndexStr = getIndexLetter(context, details.globalPosition)!;
    //   widget.indexBarCallBlock(_currentIndexStr);
    //   print(_currentIndexStr);
    //   widget.indexBarCallBlock(_currentIndexStr);
    // }
    _backgroundColor = Colors.green;
    _textColor = Colors.white;
    setState(() {});
    // print(DragDownDetails);
  }

  //点击松开
  void dragEnd(details) {
    _backgroundColor = Colors.transparent;
    _textColor = Colors.black;
    setState(() {});
    // print(DragDownDetails);
  }

  //点击之后滑动
  //  ~/ 除后取整  clamp()是对边界情况的处理，意思调用该函数的结果在它的两个参数之间
  void dragUpdate(details) {
    if (_currentIndexStr != getIndexLetter(context, details.globalPosition)!) {
      _currentIndexStr = getIndexLetter(context, details.globalPosition)!;
      widget.indexBarCallBlock(_currentIndexStr);
    }
    _backgroundColor = Colors.green;
    _textColor = Colors.white;
    setState(() {});
  }

  String? getIndexLetter(BuildContext context, Offset globalPosition) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    if (box != null) {
      double y = box.globalToLocal(globalPosition).dy;
      final itemHeight = screenHeight(context) * 0.6 / 28;
      int index = (y ~/ itemHeight).clamp(0, indexWords.length - 1);
      // print(indexWords[index]);
      return indexWords[index];
    }
    return null;
  }

  Widget build(BuildContext context) {
    //26字母+2
    List<Widget> indexWidgets = [];
    for (int i = 0; i < indexWords.length; i++) {
      var string = String.fromCharCode(i + 65);
      indexWidgets.add(Expanded(
        child: Container(
          // color: _backgroundColor,
          child: Text(
            indexWords[i],
            style: TextStyle(fontSize: 10, color: _textColor),
          ),
        ),
      ));
    }

    return Positioned(
        top: screenHeight(context) * 0.08,
        right: 5,
        width: 30,
        height: screenHeight(context) * 0.6,
        //整个竖条
        child: GestureDetector(
          onVerticalDragDown: dragDown,
          onVerticalDragEnd: dragEnd,
          onVerticalDragUpdate: dragUpdate,
          child: Container(
            // color: Colors.transparent,
            color: _backgroundColor,
            //26字母+2
            child: Column(
              children: indexWidgets,
            ),
          ),
        ));
  }
}
