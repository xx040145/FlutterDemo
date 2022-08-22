import 'package:flutter/material.dart';
import 'car.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: _cellForRow,
    );
  }

  Widget _cellForRow(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      // child: Text(cars[index].name),
      child: Column(
        children: [
          Text(cars[index].name),
          Container(
            height: 30,
          ),
          Image.network(cars[index].imageUrl),
        ],
      ),
    );
  }
}
