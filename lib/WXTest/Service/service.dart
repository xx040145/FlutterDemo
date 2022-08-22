import 'package:dio/dio.dart';

Future<String> getChatData() async {
  Response response;
  var dio = Dio();
  response = await dio.get('http://rap2api.taobao.org/app/mock/data/2318852');
  // print(response.data);
  return (response.toString());
}
