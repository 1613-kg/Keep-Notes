import 'package:flutter/material.dart';

class MyNotesImp {
  static final String id = "id";
  static final String pin = "pin";
  static final String title = "title";
  static final String content = "content";
  static final String createdTime = "createdTime";
  static final String TableName = "Notes";
  static final List<String> values = [id, pin, title, content, createdTime];
}

class MyNotes {
  final int? id;
  final bool pin;
  final String title;
  final String content;
  final DateTime createdTime;

  MyNotes(
      {this.id,
      required this.pin,
      required this.title,
      required this.content,
      required this.createdTime});

  MyNotes copy({
    int? id,
    bool? pin,
    String? title,
    String? content,
    DateTime? createdTime,
  }) {
    return MyNotes(
        id: id ?? this.id,
        pin: pin ?? this.pin,
        title: title ?? this.title,
        content: content ?? this.content,
        createdTime: createdTime ?? this.createdTime);
  }

  static MyNotes fromJson(Map<String, Object?> json) {
    return MyNotes(
        id: json[MyNotesImp.id] as int?,
        pin: json[MyNotesImp.pin] == 1,
        title: json[MyNotesImp.title] as String,
        content: json[MyNotesImp.content] as String,
        createdTime: DateTime.parse(json[MyNotesImp.createdTime] as String));
  }

  Map<String, Object?> toJson() {
    return {
      MyNotesImp.id: id,
      MyNotesImp.id: id,
      MyNotesImp.pin: pin ? 1 : 0,
      MyNotesImp.title: title,
      MyNotesImp.content: content,
      MyNotesImp.createdTime: createdTime.toIso8601String()
    };
  }
}
