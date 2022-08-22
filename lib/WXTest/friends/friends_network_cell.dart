import 'package:flutter/material.dart';
import '../const.dart';

class FriendsNetCell extends StatefulWidget {
  final String headImage;
  final String titleStr;
  final String? groupTitle;
  const FriendsNetCell(
      {Key? key,
      required this.headImage,
      required this.titleStr,
      this.groupTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FriendsNetCellWidget();
  }
}

class FriendsNetCellWidget extends State<FriendsNetCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 54,
      child: Column(
        children: [
          //0.是否有section
          Container(
            width: screenWidth(context),
            height: widget.groupTitle == null ? 0 : 30,
            color: themeColor,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: widget.groupTitle == null
                ? null
                : Text(
                    widget.groupTitle!,
                  ),
          ),
          Row(
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
              //2.title+下面的横线
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
          )
        ],
      ),
    );
  }
}
