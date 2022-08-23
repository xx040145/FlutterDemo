import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../const.dart';
import 'chat_listview.dart';
import '../Service/service.dart';
import 'chat_list_entity.dart';
import 'package:easy_refresh/easy_refresh.dart';

class ChatController extends StatefulWidget {
  const ChatController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatWidget();
  }
}

class ChatWidget extends State<ChatController>
    with AutomaticKeepAliveClientMixin {
  //1.初始化 EasyRefreshController
  late EasyRefreshController _controller;
  GlobalKey<ChatWidget> widgetKey = GlobalKey();

  List<ChatListChatList> dataList = [];
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );

    receiveMessage();
  }
  //4.释放refresh的controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void receiveMessage() {
    messageChannel.setMessageHandler((message) async {
      print('message: $message');
      _controller.callRefresh();
      setState(() {
        dataList = dataList;
      });
      return '返回Native端的数据';
    });
  }

  void makeMethod(String jsonString) {
    EasyLoading.dismiss();
    Map<String, dynamic> map = json.decode(jsonString);
    var data = new ChatListEntity.fromJson(map);
    _controller.finishRefresh();
    _controller.finishLoad();
    //3.请求完成后，结束刷新状态
    setState(() {
      if(dataList.length != 0){
        dataList.addAll(data.chatList);
        // _controller.
      }else {
        dataList = data.chatList;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          '微信',
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      //2.body添加EasyRefresh，设置头部底部，设置请求方法
      body: EasyRefresh(
        controller: _controller,
          refreshOnStart: true,
          refreshOnStartHeader: const ClassicHeader(

        ),
        footer: const ClassicFooter(),
        onRefresh: () async {
          EasyLoading.show(status: '加载中');
          getChatData().then((value) => makeMethod(value));
        },
        onLoad: () async {
          EasyLoading.show(status: '加载中');
          getChatData().then((value) => makeMethod(value));
        },
          //child 主体view
        child:ChatView(dataList:dataList,cellSelectBlock: (index){
          print('点击了${index}的cell');
        })
      ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
