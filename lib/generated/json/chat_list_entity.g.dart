import 'package:flutter_addtotest/generated/json/base/json_convert_content.dart';
import 'package:flutter_addtotest/WXTest/chat/chat_list_entity.dart';

ChatListEntity $ChatListEntityFromJson(Map<String, dynamic> json) {
	final ChatListEntity chatListEntity = ChatListEntity();
	final List<ChatListChatList>? chatList = jsonConvert.convertListNotNull<ChatListChatList>(json['chatList']);
	if (chatList != null) {
		chatListEntity.chatList = chatList;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		chatListEntity.page = page;
	}
	final int? discoverRedpoint = jsonConvert.convert<int>(json['discover_redpoint']);
	if (discoverRedpoint != null) {
		chatListEntity.discoverRedpoint = discoverRedpoint;
	}
	return chatListEntity;
}

Map<String, dynamic> $ChatListEntityToJson(ChatListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['chatList'] =  entity.chatList.map((v) => v.toJson()).toList();
	data['page'] = entity.page;
	data['discover_redpoint'] = entity.discoverRedpoint;
	return data;
}

ChatListChatList $ChatListChatListFromJson(Map<String, dynamic> json) {
	final ChatListChatList chatListChatList = ChatListChatList();
	final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
	if (imageUrl != null) {
		chatListChatList.imageUrl = imageUrl;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		chatListChatList.userName = userName;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		chatListChatList.message = message;
	}
	return chatListChatList;
}

Map<String, dynamic> $ChatListChatListToJson(ChatListChatList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['imageUrl'] = entity.imageUrl;
	data['userName'] = entity.userName;
	data['message'] = entity.message;
	return data;
}