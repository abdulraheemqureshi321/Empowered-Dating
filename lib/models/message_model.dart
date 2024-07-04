import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{
  String? messageid;
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessageModel({
    this.sender,
    this.text,
    this.seen,
    this.createdon,
    this.messageid
});

  MessageModel.fromMap(Map<String , dynamic> map){
    sender = map["sender"];
    text = map["text"];
    seen = map["seen"];
    createdon = map["createdon"] != null ? (map["createdon"] as Timestamp).toDate() : null;
    messageid = map["messageid"];
  }

  Map<String , dynamic> toMap(){
    return {
      "sender" : sender,
      "text" : text,
      "seen" : seen,
      "createdon" : createdon,
      "messageid" : messageid
    };
  }
}