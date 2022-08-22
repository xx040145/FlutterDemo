import 'package:flutter/material.dart';
import 'chat_list_entity.dart';
import '../const.dart';

class ChatListViewCell extends StatefulWidget {
  final ChatListChatList chatModel;
  final int index;
  final void Function(int index) cellSelectBlock;

  const ChatListViewCell({Key? key,required this.chatModel,required this.index,required this.cellSelectBlock}) : super(key: key);

  @override
  State<ChatListViewCell> createState() => _ChatListViewCellState();
}

class _ChatListViewCellState extends State<ChatListViewCell> {
  Color _cellBackgroundColor = Colors.white;
  double _cellHeight = 54;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: _cellHeight,
          color: _cellBackgroundColor,
          child: Row(
            children: [
              //1.头像
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      widget.chatModel.imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  )),
              //2.主体和横线
              Container(
                height: _cellHeight,
                width: screenWidth(context)-64,
                child: Column(
                  children: [
                    Container(//2.1.左边的两行文字，右边的日期时间和静音图标
                      height:_cellHeight-1,
                      width: screenWidth(context)-64,
                      child: Row(
                        children: [
                          Container(
                            child: Column(//两行文字
                              children: [
                                Container(//名字
                                  margin: const EdgeInsets.only(top: 7),
                                  width: screenWidth(context)-64-80,
                                  child: Text(
                                    widget.chatModel.userName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15.5,
                                    ),
                                  ),
                                ),
                                Container(//信息
                                  width: screenWidth(context)-64-80,
                                  child: Text(
                                    widget.chatModel.message,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child:
                            Column(//日期时间 和 静音图标
                              children: [
                                Container(//日期时间
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(right: 10),
                                  width: 80,
                                  child: Text(
                                    '昨晚 22：35',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                // Container(//静音图标
                                //   margin: const EdgeInsets.only(top: 4),
                                //   padding: EdgeInsets.only(right: 10),
                                //   width: 80,
                                //   child: Text(
                                //     'A',
                                //     textAlign: TextAlign.right,
                                //     style: TextStyle(
                                //       color: Colors.black12,
                                //       fontSize: 12,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    ),
                    Container(//2.2.下边的横线
                      height: 1,
                      width: screenWidth(context) - 64,
                      color: themeColor,
                    ),
                  ]
                ),
              ),
            ]
          ),
        ),

      onTapDown: (details){
          setState(() {
            _cellBackgroundColor = Color.fromRGBO(230, 230, 230, 1);
          });
        },
      onTapUp: (details){
        setState(() {
          _cellBackgroundColor = Colors.white;
          widget.cellSelectBlock(widget.index);
        });
      },
      onTapCancel: (){
          setState(() {
            _cellBackgroundColor = Colors.white;
          });
      },
    );}
}
