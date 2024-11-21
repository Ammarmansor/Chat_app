// ignore: file_names
class MessageModel {
  String message;
  MessageModel({required this.message});
  factory MessageModel.fromjson(jsondata){
    return MessageModel(message: jsondata['message']);
  }
}