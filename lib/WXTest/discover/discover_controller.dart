import 'package:flutter/material.dart';
import '../const.dart';
import 'discover_view.dart';
import 'discover_model.dart';

class DiscoverController extends StatefulWidget {
  const DiscoverController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DiscoverWidget();
  }
}

class DiscoverWidget extends State<DiscoverController>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          '发现',
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: DiscoverView(datas: dis_datas), //主体view
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

final List<Discover_cell_data> dis_datas = [
  const Discover_cell_data(
      title: '朋友圈',
      imageStr: 'images/baseImages/111.png',
      subTitle: '',
      subImageStr: 'images/baseImages/head_male.png'),
  const Discover_cell_data(
      title: '直播',
      imageStr: 'images/baseImages/222.png',
      subTitle: '俄罗斯进口商品馆直播中',
      subImageStr: 'images/baseImages/head_male.png'),
  const Discover_cell_data(
      title: '扫一扫',
      imageStr: 'images/baseImages/333.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '摇一摇',
      imageStr: 'images/baseImages/444.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '看一看',
      imageStr: 'images/baseImages/555.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '附近',
      imageStr: 'images/baseImages/666.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '小程序',
      imageStr: 'images/baseImages/777.png',
      subTitle: '',
      subImageStr: ''),
];
