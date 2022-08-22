import 'package:flutter_addtotest/generated/json/base/json_field.dart';
import 'package:flutter_addtotest/generated/json/chat_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ChatListEntity {

	late List<ChatListChatList> chatList;
	late int page;
	@JSONField(name: "discover_redpoint")
	late int discoverRedpoint;
  
  ChatListEntity();

  factory ChatListEntity.fromJson(Map<String, dynamic> json) => $ChatListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChatListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ChatListChatList {

	late String imageUrl;
	late String userName;
	late String message;
  
  ChatListChatList();

  factory ChatListChatList.fromJson(Map<String, dynamic> json) => $ChatListChatListFromJson(json);

  Map<String, dynamic> toJson() => $ChatListChatListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}