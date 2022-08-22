import 'package:flutter/material.dart';
import 'discover_cell.dart';
import 'discover_model.dart';

class DiscoverView extends StatefulWidget {
  final List<Discover_cell_data> datas;

  const DiscoverView({super.key, required this.datas});

  @override
  State<StatefulWidget> createState() {
    return DiscoverWidget();
  }
}

class DiscoverWidget extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DiscoverCell(data: widget.datas[0],index: 0,cellSelectBlock: (int index){},),
      const SizedBox(height: 10),
      DiscoverCell(data: widget.datas[1],index: 1,cellSelectBlock: (int index){},),
      const SizedBox(height: 10),
      DiscoverCell(data: widget.datas[2],index: 2,cellSelectBlock: (int index){},),
      Row(children: [
        Container(
          color: Colors.white,
          height: 0.5,
          width: 50,
        )
      ]),
      DiscoverCell(data: widget.datas[3],index: 3,cellSelectBlock: (int index){},),
      const SizedBox(height: 10),
      DiscoverCell(data: widget.datas[4],index: 4,cellSelectBlock: (int index){},),
      const SizedBox(height: 10),
      DiscoverCell(data: widget.datas[5],index: 5,cellSelectBlock: (int index){},),
      const SizedBox(height: 10),
      DiscoverCell(data: widget.datas[6],index: 6,cellSelectBlock: (int index){},),
    ]);
    // return ListView.builder(
    //   itemCount: widget.datas.length,
    //   itemBuilder: (BuildContext context, int a) {
    //     return DiscoverCell(
    //       data: widget.datas[a],
    //     );
    //   },
    // );
  }
}
