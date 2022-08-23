# FlutterDemo

A new Flutter module project.Can run in the Simulator singly,or run in a iOS app.
Before all,we need flutter environment and IDE firstly.

## use singly

Open the project with your develop IDE(Visual Studio Code,or Android Studio), then open the Simulator(like iPhone13), run the lib/main.dart file.

## use in a iOS app

add in Podfile.
```
flutter_application_path = '../FlutterDemo'  //this flutter project src
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb') 
install_all_flutter_pods(flutter_application_path)
```
then 
```
pod install
```

in the AppDelegate file
```
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@property (nonatomic, strong) FlutterEngine *flutterEngine;
```
in the .m file
```
FlutterEngine *flutterEngine = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).flutterEngine;
FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
flutterVC.navigationController.navigationBarHidden = YES;
[self.navigationController pushViewController:flutterVC animated:YES];
```
## communicate with native
in the .dart file
```
const channel = MethodChannel('channel:test');
const messageChannel = BasicMessageChannel('messageChannel:test', StandardMessageCodec());
  
Future<void> _firstViewDone() async {
    try {
      //send message to native
      final String nativeSay = await channel.invokeMethod('firstViewDone', '首页加载完毕');
      print("$nativeSay");
      // nativeSay is the message sent from native
      if (nativeSay == 'firstViewLoad'){

      }
    }catch(error){
      print(error.toString());
    }
}
//use
_firstViewDone();
  
Future<String> sendMessage() async {
    Object? reply = await messageChannel.send('backToNative');
    print('reply: $reply');
    return reply.toString();
}
//use 
sendMessage();
  
void receiveMessage() {
  messageChannel.setMessageHandler((message) async {
    print('message: $message');
    _controller.callRefresh();
    setState(() {
      dataList = dataList;
    });
    return '返回Native端的数据';
  });
}
//use
receiveMessage();
```
in the .m file
```
NSString *channelName = @"channel:test";
//单项通信管道，Flutter向原生发送消息
FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVC.binaryMessenger];
[messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
    //可以在这里实现flutter发给原生要实现的方法
    NSLog(@"%@,%@",call.method,call.arguments);
    if ([call.method isEqualToString:@"firstViewDone"]){
        result(@"firstViewLoad");
    }
    if ([call.method isEqualToString:@"closeFlutter"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}];

FlutterBasicMessageChannel* messageChannel2 = [FlutterBasicMessageChannel messageChannelWithName:@"messageChannel:test" binaryMessenger:flutterVC.binaryMessenger];
// 发送消息
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [messageChannel2 sendMessage:(@"发送给flutter的数据") reply:^(id reply) {
    NSLog(@"reply：%@", reply);
    }];
});
// 接收消息监听
[messageChannel2 setMessageHandler:^(id message, FlutterReply callback) {
    NSLog(@"%@", message);
    if ([message isEqualToString:@"backToNative"]) {
    [self.navigationController popViewControllerAnimated:YES];
    }
    callback(@"返回flutter端的数据");
}];
```

## dependencies in the pubspec.yaml
```
  dio: ^4.0.6
  flutter_easyloading: ^3.0.3
  easy_refresh: ^3.0.4+2
  image_picker_iOS: ^0.8.5+3
  fl_chart: ^0.55.1 //(not use yet)
```
## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).
