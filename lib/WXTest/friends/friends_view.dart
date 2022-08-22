import 'package:flutter/material.dart';
import '../const.dart';
import 'friends_local_cell.dart';
import 'friends_network_cell.dart';
import 'friends_model.dart';
import 'friends_indexbar_view.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({
    super.key,
    required this.localData,
    required this.netData,
  });
  final List<FriendsDataModel> localData;
  final List<FriendsDataModel> netData;

  @override
  State<StatefulWidget> createState() {
    return FriendsWidget();
  }
}

class FriendsWidget extends State<FriendsView> {
  final ScrollController _scrollController = ScrollController();
  double _maxScrollOffset = double.maxFinite;
  final _groupOffsetMap = {
    '🔍': 0.1,
  };

  @override
  void initState() {
    super.initState();

    var groupOffset = widget.localData.length * 54.0;
    for (int i = 0; i < widget.netData.length; i++) {
      if (i == 0) {
        _groupOffsetMap.addAll({widget.netData[i].groupTitle!: groupOffset});
        groupOffset += 30 + 54;
      } else if (widget.netData[i].groupTitle ==
          widget.netData[i - 1].groupTitle) {
        groupOffset += 54;
      } else {
        _groupOffsetMap.addAll({widget.netData[i].groupTitle!: groupOffset});
        groupOffset += 30 + 54;
      }
    }
    print('_groupOffsetMap:${_groupOffsetMap}');
  }

  //复用cell
  Widget cellForRow(BuildContext context, int index) {
    //上面本地的cell
    if (index < widget.localData.length) {
      return FriendsLocalCell(
          headImage: widget.localData[index].imageStr,
          titleStr: widget.localData[index].titleStr);
    }
    final FriendsDataModel friendsDataFirst =
        widget.netData[index - widget.localData.length];
    //下面通讯录cell
    if (index == widget.localData.length) {
      return FriendsNetCell(
        headImage: friendsDataFirst.imageStr,
        titleStr: friendsDataFirst.titleStr,
        groupTitle: friendsDataFirst.groupTitle,
      );
    } else {
      final FriendsDataModel friendsDataBefore =
          widget.netData[index - widget.localData.length - 1];
      //如果和上一个数据的groupTitle一样
      if (friendsDataFirst.groupTitle == friendsDataBefore.groupTitle) {
        return FriendsNetCell(
          headImage: friendsDataFirst.imageStr,
          titleStr: friendsDataFirst.titleStr,
        );
      } else {
        return FriendsNetCell(
          headImage: friendsDataFirst.imageStr,
          titleStr: friendsDataFirst.titleStr,
          groupTitle: friendsDataFirst.groupTitle,
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
                child: NotificationListener(
              onNotification: (ScrollNotification note) {
                _maxScrollOffset = note.metrics.maxScrollExtent.toDouble();
                return true;
              },
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.localData.length + widget.netData.length,
                  itemBuilder: cellForRow),
            )),
            FriendsIndexBarView(
              //点击右侧index的回调
              indexBarCallBlock: (String str) {
                print(str);
                if (_groupOffsetMap[str] != null) {
                  print(_groupOffsetMap[str]!);
                  print(_maxScrollOffset);
                  if (_maxScrollOffset == 0 ||
                      _groupOffsetMap[str]! < _maxScrollOffset) {
                    _scrollController.animateTo(_groupOffsetMap[str]!,
                        duration: Duration(milliseconds: 10),
                        curve: Curves.easeIn);
                  } else {
                    _scrollController.animateTo(_maxScrollOffset,
                        duration: Duration(milliseconds: 10),
                        curve: Curves.easeIn);
                  }
                }
              },
            )
          ],
        ));
  }
}
