import 'package:aliens/models/message_model.dart';
import 'package:aliens/repository/sql_message_database.dart';
import 'package:sqflite/sqflite.dart';

class SqlMessageRepository{
  static Future<void> create(MessageModel messageModel) async {
    var _db = await SqlMessageDataBase().database;
    await _db.insert("chat",
        messageModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<MessageModel>> getList(int roomId) async{
    var _db = await SqlMessageDataBase().database;
    var result = await _db.query("chat", columns: [
      MessageFields.chatId,
      MessageFields.chatType,
      MessageFields.chatContent,
      MessageFields.roomId,
      MessageFields.senderId,
      MessageFields.senderName,
      MessageFields.receiverId,
      MessageFields.sendTime,
      MessageFields.unReadCount,
    ]);
    List<MessageModel> _list = [];

    for(final message in result){
      if(MessageModel.fromJson(message).roomId != roomId)
        continue;
      _list.add(MessageModel.fromJson(message));
    }
    return _list;
  }

  static Future<String> getCurrentMessage(int roomId) async {
    String currentMessage = '';
    var _db = await SqlMessageDataBase().database;
    var result = await _db.query("chat", columns: [
      MessageFields.chatId,
      MessageFields.chatType,
      MessageFields.chatContent,
      MessageFields.roomId,
      MessageFields.senderId,
      MessageFields.senderName,
      MessageFields.receiverId,
      MessageFields.sendTime,
      MessageFields.unReadCount,
    ]);
    for(int i =0; i < result.length; i++){
      if(MessageModel.fromJson(result[i]).roomId != roomId)
        continue;
      currentMessage = MessageModel.fromJson(result[i]).chatContent!;
    }
    return currentMessage;
  }

  static Future<String> getCurrentTime(int roomId) async {
    String currentTime = '';
    var _db = await SqlMessageDataBase().database;
    var result = await _db.query("chat", columns: [
      MessageFields.chatId,
      MessageFields.chatType,
      MessageFields.chatContent,
      MessageFields.roomId,
      MessageFields.senderId,
      MessageFields.senderName,
      MessageFields.receiverId,
      MessageFields.sendTime,
      MessageFields.unReadCount,
    ]);
    for(int i =0; i < result.length; i++){
      if(MessageModel.fromJson(result[i]).roomId != roomId)
        continue;
      currentTime = MessageModel.fromJson(result[i]).sendTime!;
    }
    return currentTime;
  }

  static Future<int> getUnreadChat(int roomId) async {
    int unreadChatCount = 0;
    var _db = await SqlMessageDataBase().database;
    var result = await _db.query("chat", columns: [
      MessageFields.chatId,
      MessageFields.chatType,
      MessageFields.chatContent,
      MessageFields.roomId,
      MessageFields.senderId,
      MessageFields.senderName,
      MessageFields.receiverId,
      MessageFields.sendTime,
      MessageFields.unReadCount,
    ]);
    for(int i =0; i < result.length; i++){
      if(MessageModel.fromJson(result[i]).roomId != roomId)
        continue;
      if(MessageModel.fromJson(result[i]).unReadCount != 0)
        unreadChatCount++;
    }
    return unreadChatCount;
  }

  static Future<int> update(MessageModel message) async {
    var _db = await SqlMessageDataBase().database;
    return await _db.update(
      "chat",
      message.toJson(),
      where: 'chatId = ?',
      whereArgs: [message.chatId],
    );
  }

}

