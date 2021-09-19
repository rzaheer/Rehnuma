import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


  DateTime toDateTime(Timestamp value) {
    if (value == null) return null;

    return value.toDate();
  }

  dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;

    return date.toUtc();
  }
class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String sentBy;
  final String message;
  final DateTime createdAt;

  const Message({
    @required this.sentBy,
    
    
    @required this.message,
    @required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        sentBy: json['sentBy'],
        message: json['message'],
        createdAt: toDateTime(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'sentBy': sentBy,
        'message': message,
        'createdAt': fromDateTimeToJson(createdAt),
      };
}

class AllMsgModel {
  final String messageId;
  final String studentId,mentorId,mentorName,studentName;
  final DateTime lastMessageTime;

  const AllMsgModel({
     this.messageId,
    this.mentorId,
    this.mentorName,
     this.studentId,
    this.lastMessageTime,
    this.studentName
  });

  static AllMsgModel fromJson(Map<String, dynamic> json) => AllMsgModel(
        mentorName:  json['mentorName'],
        studentName: json['studentName'],
        messageId: json['messageId'],
        lastMessageTime: toDateTime(json['lastMessageTime']),
        mentorId: json['mentorId'],
        studentId: json["studentId"]
      );

  Map<String, dynamic> toJson() => {
        'mentorName': mentorName,
        'studentName': studentName,
        'messageId':messageId,
        'lastMessageTime': fromDateTimeToJson(lastMessageTime),
        'mentorId':mentorId,
        'studentId':studentId

      };
}