import 'package:flutter/material.dart';
import '../discover/discover_model.dart';
import '../const.dart';
import 'mine_view.dart';
import 'mine_model.dart';
import 'package:image_picker/image_picker.dart';
import 'paint_page.dart';
import 'animate_page.dart';
import '../event_bus.dart';

class MineController extends StatefulWidget {
  const MineController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MineWidget();
  }
}

class MineWidget extends State<MineController>
    with AutomaticKeepAliveClientMixin {
  //点击了头像，打开相册
  final ImagePicker _picker = ImagePicker();
  Future _getImage() async {
    //选择相册
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // print(image);
    ///Users/zk/Library/Developer/CoreSimulator/Devices/510EE886-0183-4A47-813B-A1072EEC62A2/data/Containers/Data/Application/1F65266C-7B40-4886-834F-652FCBC0BBD9/
    ///tmp/image_picker_BEE08E26-C04E-485E-9F35-4AB8060E1DFC-7568-000012217F963B9B.jpg
      setState(() {
        if(image != null){
          print(image.path);
        }else{
          print('没有照片可以选择');
        }
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MineView(datas: data,headerSelectBlock: (){
      // print('111');
      _getImage();
      //点击了头像，打开相册
      // final ImagePicker _picker = ImagePicker();
      // // Pick an image
      // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      // // Capture a photo
      // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      // // Pick a video
      // final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
      // // Capture a video
      // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      // // Pick multiple images
      // final List<XFile>? images = await _picker.pickMultiImage();
    },cellSelectBlock: (index){
      switch(index){
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  PaintController()));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  AnimatePage()));
          break;
        default:
          sendMessage();
          break;
      }
    },);
  }

  Future<String> sendMessage() async {
    Object? reply = await messageChannel.send('backToNative');
    print('reply: $reply');
    eventBus.fire(TabbatIndexEvent(0));
    return reply.toString();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

final List<Discover_cell_data> data = [
  const Discover_cell_data(
      title: '服务',
      imageStr: 'images/baseImages/111.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '收藏',
      imageStr: 'images/baseImages/222.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '朋友圈',
      imageStr: 'images/baseImages/333.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '卡包',
      imageStr: 'images/baseImages/444.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '表情',
      imageStr: 'images/baseImages/555.png',
      subTitle: '',
      subImageStr: ''),
  const Discover_cell_data(
      title: '设置',
      imageStr: 'images/baseImages/666.png',
      subTitle: '',
      subImageStr: ''),
];
