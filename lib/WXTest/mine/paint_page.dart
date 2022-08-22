import 'package:flutter/material.dart';
import 'package:flutter_addtotest/WXTest/const.dart';
import 'dart:math';

import 'package:flutter_addtotest/WXTest/mine/mine_controller.dart';
// import 'package:flutter/painting.dart';

class PaintController extends StatefulWidget {
  const PaintController({Key? key}) : super(key: key);

  @override
  State<PaintController> createState() => _PaintControllerState();
}

class _PaintControllerState extends State<PaintController> {
  double width=0;
  var dataList = [
    {'x':1,'y':10,'h':-200,'g':55},{'x':2,'y':15,'h':100,'g':44},{'x':3,'y':17,'h':400,'g':47},
    {'x':4,'y':19,'h':50,'g':67},{'x':5,'y':17,'h':300,'g':79},{'x':6,'y':15,'h':-100,'g':73},
    {'x':7,'y':13,'h':200,'g':81},{'x':8,'y':15,'h':400,'g':82},{'x':9,'y':18,'h':-400,'g':77},
    {'x':10,'y':15,'h':-100,'g':65},
    {'x':11,'y':10,'h':-200,'g':55},{'x':12,'y':17,'h':100,'g':44},{'x':13,'y':15,'h':400,'g':47},
    {'x':14,'y':14,'h':50,'g':67},{'x':15,'y':11,'h':300,'g':79},{'x':16,'y':10,'h':-100,'g':73},
    {'x':17,'y':13,'h':200,'g':81},{'x':18,'y':12,'h':400,'g':82},{'x':19,'y':11,'h':-400,'g':77},
    {'x':20,'y':18,'h':-100,'g':65},
    {'x':21,'y':10,'h':-200,'g':55},{'x':22,'y':17,'h':100,'g':44},{'x':23,'y':15,'h':400,'g':47},
    {'x':24,'y':14,'h':50,'g':67},{'x':25,'y':11,'h':300,'g':79},{'x':26,'y':10,'h':-100,'g':73},
    {'x':27,'y':13,'h':200,'g':81},{'x':28,'y':12,'h':400,'g':82},{'x':29,'y':11,'h':-400,'g':77},
    {'x':30,'y':18,'h':-100,'g':65},];

  @override
  Widget build(BuildContext context) {
    width = screenWidth(context);
    return Scaffold(
      appBar: AppBar(title: Text('视图绘制'),),
      body: CustomPaint(
        // painter: BackgroundPainterK(size:Size(width,300),dataList:dataList),
        foregroundPainter: ForegroundPainterK(size:Size(width,300),dataList:dataList),
        // size: Size(width, 300),
        child: Container(
          width: screenWidth(context),
          height: 300,
          child: Column(
            children: [
              Container(
                height: 30,
                child: Row(
                  children: [Text('100')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('90')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('80')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('70')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('60')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('50')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('40')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('30')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('20')],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [Text('10')],
                ),
              ),
            ],
          ),
        ),
        // (
        //   child: ClipOval(
        //     child: Image.asset(
        //       'images/baseImages/20210709142454_dc8dc.jpeg',
        //       width: 200,
        //       height: 200,
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        // ),//1
      ),
    );
  }
}
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Color(0xFFF1F1F1), BlendMode.color);
    var center = size / 2;
    var paint = Paint()..color = Color(0xFF2080E5);
    paint.strokeWidth = 2.0;

    canvas.drawRect(
      Rect.fromLTWH(center.width - 120, center.height - 120, 240, 240),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class ForegroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = Color(0x80F53010);
    paint.strokeWidth = 2.0;

    canvas.drawCircle(
      Offset(center.width, center.height),
      100,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class BackgroundPainterK extends CustomPainter {
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
class ForegroundPainterK extends CustomPainter {
  final size;
  final List dataList;
  ForegroundPainterK({Key?key, this.size,required this.dataList});

  @override
  void paint(Canvas canvas, Size size) {
    //框架
    Paint paintFrame = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    Path pathFrame = Path();
    pathFrame.moveTo(25, size.height);
    pathFrame.lineTo(size.width-10, size.height);
    canvas.drawPath(pathFrame, paintFrame);
    Path pathFrameY = Path();
    pathFrameY.moveTo(25, size.height);
    pathFrameY.lineTo(25, 5);
    canvas.drawPath(pathFrameY, paintFrame);

    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    //获取x最高的
    double perWidth = (size.width-50)/dataList.length;
    //获取y最高的
    dataList.sort((a, b) => b['y'].compareTo(a['y']));
    double perHeigth = size.height/dataList[0]['y']*0.5;

    //没有用深拷贝，还原
    dataList.sort((a, b) => a['x'].compareTo(b['x']));

    Path path = Path();
    for(int i=0;i<dataList.length;i++){
      //线图
      double x = dataList[i]['x'] * perWidth +35;
      double y = size.height-dataList[i]['y'] * perHeigth;
      if(i==0){
        path.moveTo(x, y);
      }else {
        path.lineTo(x, y);
      }

      //柱状
      Paint paint2;
      // int xx = dataList[i]['h']??0;
      if(dataList[i]['h']>0){
        paint2 = Paint()..color = Colors.green;
      }else {
        paint2 = Paint()..color = Colors.redAccent;
      }
      canvas.drawRect(
        Rect.fromLTWH(x-5, size.height/100*dataList[i]['g']*0.5, 10, dataList[i]['h'].abs()*0.05),
        paint2,
      );
      //柱的线
      Path path2 = Path();
      paint2.style = PaintingStyle.stroke;
      paint2.strokeWidth = 1.0;
      path2.moveTo(x, size.height/100*dataList[i]['g']*0.5-20);
      path2.lineTo(x, size.height/100*dataList[i]['g']*0.5+dataList[i]['h'].abs()*0.05+20);
      canvas.drawPath(path2, paint2);
    }
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
