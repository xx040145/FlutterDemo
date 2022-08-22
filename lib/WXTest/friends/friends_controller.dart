import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_addtotest/WXTest/mine/mine_controller.dart';
import '../const.dart';
import 'friends_view.dart';
import 'friends_model.dart';

class FriendsController extends StatefulWidget {
  const FriendsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FriendsWidget();
  }
}

class FriendsWidget extends State<FriendsController>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    friUsersData.sort((FriendsDataModel a, FriendsDataModel b) {
      return a.groupTitle!.compareTo(b.groupTitle!);
    });
  }

  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          '通讯录',
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 0,
        titleSpacing: 0,
        actions: [
          GestureDetector(
            onTap: () {
              print('添加好友');
            },
            child: Container(
              margin: EdgeInsets.only(right: 14),
              child: Image(image: AssetImage('images/baseImages/333.png')),
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: FriendsView(
        localData: friLocalData,
        netData: friUsersData,
      ), //主体view
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
