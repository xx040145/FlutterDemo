import 'package:flutter/material.dart';
import 'chat_listview_cell.dart';
import 'chat_list_entity.dart';

class ChatView extends StatefulWidget {
  final List<ChatListChatList> dataList;
  final void Function(int index) cellSelectBlock;

  const ChatView({
    super.key,
    required this.dataList,
    required this.cellSelectBlock,
  });

  @override
  State<StatefulWidget> createState() {
    return ChatWidget();
  }
}

class ChatWidget extends State<ChatView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dataList.length,
      itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        child:ChatListViewCell(chatModel:widget.dataList[index],index: index,cellSelectBlock: (index){
          widget.cellSelectBlock(index);
        },),
      );
    },);
  }
}
