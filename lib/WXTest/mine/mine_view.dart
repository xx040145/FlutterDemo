import 'package:flutter/material.dart';
import '../const.dart';
import '../discover/discover_cell.dart';
import '../discover/discover_model.dart';

class MineView extends StatefulWidget {
  final List<Discover_cell_data> datas;
  final String headerImageStr = 'images/baseImages/20190211190144_jspau.jpg';
  final String name = '微信名字XXX';
  final String wxId = '微信号: xxxxxxxx';
  final String qrCode = 'images/baseImages/erweima.png';
  void Function() headerSelectBlock;
  void Function(int index) cellSelectBlock;

  final List<String> friendsImagesList = [
    'images/baseImages/20210709142454_dc8dc.jpeg',
    'images/baseImages/e8fffe526afe3218d4a87eadbd9eb836.jpg',
    // 'images/baseImages/5e4b7a2e15c1a368bb48f5ea6eb6a2a8.jpg',
    // 'images/baseImages/5e4b7a2e15c1a368bb48f5ea6eb6a2a8.jpg',
    // 'images/baseImages/5e4b7a2e15c1a368bb48f5ea6eb6a2a8.jpg',
  ];

  MineView({super.key, required this.datas,required this.headerSelectBlock,required this.cellSelectBlock});

  @override
  State<StatefulWidget> createState() {
    return MineViewWidget();
  }
}

class MineViewWidget extends State<MineView> {
  int index = 0;

  //圆头像+白色的边框
  Widget circleViewWithWhiteCircle(int index, String imgStr) {
    return Container(
        width: 18,
        height: 18,
        margin: EdgeInsets.only(left: index * 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        clipBehavior: Clip.hardEdge,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Image.asset(
            imgStr,
            width: 18,
            height: 18,
            fit: BoxFit.cover,
            color: null,
          ),
        ));
  }

  Widget headerView() {
    return Container(
        color: bodyBackgroundColor,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //1.头像
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details){
                widget.headerSelectBlock();
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 50),
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.headerImageStr,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            //2.三行
            Container(
              // color: Colors.green,
              width: MediaQuery.of(context).size.width - 100 - 50 - 30,
              height: 90,
              margin: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.wxId,
                    style: TextStyle(
                        color: Color.fromRGBO(140, 140, 140, 1), fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 55,
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(140, 140, 140, 1),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          '+ 状态',
                          style: TextStyle(
                              color: Color.fromRGBO(140, 140, 140, 1)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //图图图等X个朋友
                      Container(
                          //圆角框
                          alignment: Alignment.center,
                          width: 80 +
                              (widget.friendsImagesList.length > 3
                                      ? 3
                                      : widget.friendsImagesList.length) *
                                  18,
                          height: 22,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(140, 140, 140, 1),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            //三个头像
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  for (int i = 0;
                                      i < widget.friendsImagesList.length &&
                                          i < 3;
                                      i++)
                                    circleViewWithWhiteCircle(
                                        i, widget.friendsImagesList[i]),
                                ],
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '等${widget.friendsImagesList.length}个朋友',
                                style: TextStyle(
                                    color: Color.fromRGBO(140, 140, 140, 1)),
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            //3.二维码+箭头
            Container(
                margin: const EdgeInsets.only(top: 50, right: 10),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(widget.qrCode),
                      width: 15,
                    ),
                    const SizedBox(width: 8),
                    const Image(
                      image: AssetImage('images/baseImages/arrow_right.png'),
                      width: 15,
                    ),
                  ],
                ))
          ],
        ));
  }

  // Widget listView() {
  //   return ListView.builder(
  //       itemCount: 6,
  //       itemBuilder: (BuildContext context, int a) {
  //         return DiscoverCell(data: widget.datas[index]);
  //       });
  // }

  // final Color _backgroudColor = const Color.fromRGBO(204, 204, 204, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: _backgroudColor,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              children: [
                headerView(),
                const SizedBox(height: 10),
                DiscoverCell(data: widget.datas[0],index: 0,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
                const SizedBox(height: 10),
                DiscoverCell(data: widget.datas[1],index: 1,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
                Row(children: [
                  Container(
                    color: Colors.white,
                    height: 0.5,
                    width: 50,
                  )
                ]),
                DiscoverCell(data: widget.datas[2],index: 2,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
                Row(children: [
                  Container(
                    color: Colors.white,
                    height: 0.5,
                    width: 50,
                  )
                ]),
                DiscoverCell(data: widget.datas[3],index: 3,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
                Row(children: [
                  Container(
                    color: Colors.white,
                    height: 0.5,
                    width: 50,
                  )
                ]),
                DiscoverCell(data: widget.datas[4],index: 4,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
                const SizedBox(height: 10),
                DiscoverCell(data: widget.datas[5],index: 5,cellSelectBlock: (int index){
                  widget.cellSelectBlock(index);
                },),
              ],
            )),
      ),
    );
  }
}
