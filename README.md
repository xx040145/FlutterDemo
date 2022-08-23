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

in the .h file
```
#import <Flutter/Flutter.h>

@property (nonatomic, strong) FlutterEngine *flutterEngine;
```
in the .m file
- (void)viewDidLoad{}
method add 
```
FlutterEngine *flutterEngine = [[FlutterEngine alloc] initWithName:@"testToFlutter"];
[flutterEngine runWithEntrypoint:nil];
```
open flutter viewcontroller
```
FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
flutterVC.navigationController.navigationBarHidden = YES;
[self.navigationController pushViewController:flutterVC animated:YES];
```

## dependencies in the pubspec.yaml
```
  dio: ^4.0.6
  flutter_easyloading: ^3.0.3
  easy_refresh: ^3.0.4+2
  image_picker_iOS: ^0.8.5+3 //(not use yet)
  fl_chart: ^0.55.1 //(not use yet)
```
## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).
