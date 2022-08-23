import 'package:flutter/material.dart';
import 'WXTest/tabbar/tabbar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../WXTest/const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(204, 204, 204, 1),
        highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
      ),
      home: const Tabbar(),
      builder: EasyLoading.init(),
    );
  }

  // _firstViewDone();
  // sendMessage();
  // receiveMessage();

  // Future<void> _firstViewDone() async {
  //   try {
  //     //send message to native
  //     final String nativeSay = await channel.invokeMethod('firstViewDone', '首页加载完毕');
  //     print("$nativeSay");
  //     // nativeSay is the message sent from native
  //     if (nativeSay == 'firstViewLoad'){
  //
  //     }
  //   }catch(error){
  //     print(error.toString());
  //   }
  // }
  // Future<String> sendMessage() async {
  //   Object? reply = await messageChannel.send('backToNative');
  //   print('reply: $reply');
  //   return reply.toString();
  // }
  // void receiveMessage() {
  //   messageChannel.setMessageHandler((message) async {
  //     print('message: $message');
  //     return '返回Native端的数据';
  //   });
  // }
}