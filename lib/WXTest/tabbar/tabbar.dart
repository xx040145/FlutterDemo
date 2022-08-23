import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import '../event_bus.dart';

import '../friends/friends_controller.dart';
import '../chat/chat_listview_controller.dart';
import '../discover/discover_controller.dart';
import '../mine/mine_controller.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabbarViewState();
}

class TabbarViewState extends State<Tabbar> {
  int currentIndex = 0;
  void onTap(int index) {
    //第三步：点击时，使用_controller.jumpToPage(index)
    _controller.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }

  //四个页面widget
  List<Widget> pages = [
    const ChatController(),
    const FriendsController(),
    const DiscoverController(),
    const MineController()
  ];
  //第一步：创建PageController 并制定初始选中页面
  final PageController _controller = PageController(initialPage: 0); // 页面控制器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //订阅eventbus
    eventBus.on<TabbatIndexEvent>().listen((event) {
      int tabbatIndex = event.tabbatIndex;
      // print('tabbatIndex:$tabbatIndex');
      onTap(tabbatIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // pages[currentIndex],
          PageView(
        //第二步：body使用PageView，并制定controller
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          _createItem(
              '微信',
              const AssetImage('images/tabbar/icon_tabbar_home.png'),
              const AssetImage('images/tabbar/icon_tabbar_home_select.png')),
          _createItem(
              '通讯录',
              const AssetImage('images/tabbar/icon_tabbar_chat.png'),
              const AssetImage('images/tabbar/icon_tabbar_chat_select.png')),
          _createItem(
              '发现',
              const AssetImage('images/tabbar/icon_tabbar_discover.png'),
              const AssetImage(
                  'images/tabbar/icon_tabbar_discover_select.png')),
          _createItem(
              '我',
              const AssetImage('images/tabbar/icon_tabbar_mine.png'),
              const AssetImage('images/tabbar/icon_tabbar_mine_select.png')),
        ],
        showSelectedLabels: true,
        selectedFontSize: 12.0,
      ),
    );
  }

  //生成item
  BottomNavigationBarItem _createItem(
      String title, AssetImage image, AssetImage imageSelect) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: image),
      ),
      activeIcon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: imageSelect),
      ),
      label: title,
    );
  }
}
