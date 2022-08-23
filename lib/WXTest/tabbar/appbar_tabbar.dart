import 'package:flutter/material.dart';
import '../friends/friends_controller.dart';
import '../chat/chat_listview_controller.dart';
import '../discover/discover_controller.dart';
import '../mine/mine_controller.dart';
import 'tabSizeIndicator.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabbarViewState();
}

class TabbarViewState extends State<Tabbar> with SingleTickerProviderStateMixin{
  var tabs = ['微信', '通讯录', '发现', '我'];
  late TabController _tabController;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
    //添加监听，记录当前切换到的页面索引
    _tabController.addListener(() {
      setState(() => _currentIndex = _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('考勤查询',style: TextStyle(fontSize: 18,color: Colors.black),),
        bottom: TabBar(
            onTap: (index) {
              setState(() {
                _currentIndex=index;
              });
            },
            //设置下划线的宽度
            indicator: MyUnderlineTabIndicator(borderSide:  BorderSide(width: 3.0, color: Colors.yellowAccent)),
            //选中下划线颜色
            indicatorColor: Colors.green,
            //选中下划线的高度，值越大高度越高，默认为2
            indicatorWeight: 1,
            //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
            // indicatorSize: TabBarIndicatorSize.tab,
            //设置选中时的字体颜色，tabs里面的字体样式优先级最高
            labelColor: Colors.redAccent,
            //设置未选中时的字体颜色
            unselectedLabelColor: Colors.black,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
            controller: _tabController, tabs: <Widget>[
          Container(
            height: 40,
            child: Center(
              child: Text(
                tabs[0],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Center(
              child: Text(
                tabs[1],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Center(
              child: Text(
                tabs[2],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 40,
            child: Center(
              child: Text(
                tabs[3],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ]),
        centerTitle: true,
        leading: IconButton(
          // icon: Icon(Icons.menu,color: Colors.black,),
          icon: Image.asset('images/tabbar/icon_tabbar_chat.png',width: 10,height: 15,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        // leadingWidth: 10,
      ),
      body: _getTabBarView(),
    );
  }

  Widget _getTabBarView() {
    return TabBarView(controller: _tabController, children: const <Widget>[
      ChatController(),
      FriendsController(),
      DiscoverController(),
      MineController()
    ]);
  }
}
