import 'package:flutter/material.dart';
import 'discover_model.dart';
import 'time_line_controller.dart';

class DiscoverCell extends StatefulWidget {
  //参数
  final Discover_cell_data data;
  final int index;
  void Function(int index)cellSelectBlock;

  DiscoverCell({
    super.key,
    required this.data,
    required this.index,
    required this.cellSelectBlock,
  });

  @override
  State<StatefulWidget> createState() => DiscoverCellState();
}

//cell的布局
class DiscoverCellState extends State<DiscoverCell> {
  Color _backgroundColor = Colors.white;
  double _cellHeight = 54;

  void tapMethod() {
    setState(() {
      _backgroundColor = Colors.white;
    });
    widget.cellSelectBlock(widget.index);
  }

  void tapDownMethod(details) {
    setState(() {
      _backgroundColor = Color.fromRGBO(230, 230, 230, 1);
    });
  }

  void tapCancelMethod() {
    setState(() {
      _backgroundColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapMethod,
      onTapDown: tapDownMethod,
      onTapCancel: tapCancelMethod,
      child: Container(
        color: _backgroundColor,
        padding: const EdgeInsets.all(10),
        height: _cellHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(children: [
              Image(
                  image: AssetImage(widget.data.imageStr),
                  width: 26,
                  height: 26),
              const SizedBox(width: 15),
              Text(
                widget.data.title,
                style: TextStyle(fontSize: 15.5),
              )
            ])),
            Container(
              child: Row(
                children: [
                  Text(
                    widget.data.subTitle,
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(width: 8),
                  widget.data.subImageStr == ''
                      ? Container()
                      : Image(
                          image: AssetImage(widget.data.subImageStr),
                          width: 30,
                          height: 30),
                  const SizedBox(width: 8),
                  const Image(
                    image: AssetImage('images/baseImages/arrow_right.png'),
                    width: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
