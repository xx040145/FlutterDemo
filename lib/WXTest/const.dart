import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color bodyBackgroundColor = Color.fromRGBO(249, 249, 249, 1);
const Color appBarColor = Color.fromRGBO(249, 249, 249, 1);
const Color appBarTextColor = Colors.black87;
const Color themeColor = Color.fromRGBO(249, 249, 249, 1);

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
const channel = MethodChannel('channel:test');
const messageChannel = BasicMessageChannel('messageChannel:test', StandardMessageCodec());
