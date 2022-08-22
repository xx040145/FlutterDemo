import 'package:flutter/material.dart';
import '../const.dart';

class FriendsLocalCell extends StatefulWidget {
  final String headImage;
  final String titleStr;
  const FriendsLocalCell(
      {Key? key, required this.headImage, required this.titleStr})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FriendsLocalCellWidget();
  }
}

class FriendsLocalCellWidget extends State<FriendsLocalCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 54,
        child: Row(
          children: [
            //1.头像
            Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    widget.headImage,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 53,
                    width: screenWidth(context) - 64,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.titleStr,
                      style: const TextStyle(fontSize: 15.5),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: screenWidth(context) - 64,
                    color: themeColor,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
