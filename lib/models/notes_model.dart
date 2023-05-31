import 'package:flutter/material.dart';

class MyNotesImp {
  static final String id = "id";
  static final String pin = "pin";
  static final String title = "title";
  static final String content = "content";
  static final String uniqueId = "uniqueId";
  static final String createdTime = "createdTime";
  static final String isArchive = "isArchive";
  static final String isDeleted = "isDeleted";
  static final String TableName = "Notes";
  static final List<String> values = [
    id,
    pin,
    title,
    content,
    createdTime,
    isArchive,
    isDeleted,
    uniqueId,
  ];
}

class MyNotes {
  final int? id;
  final bool pin;
  final bool isArchive;
  final bool isDeleted;
  final String title;
  final String content;
  final String uniqueId;
  final DateTime createdTime;

  MyNotes({
    this.id,
    required this.pin,
    required this.isArchive,
    required this.isDeleted,
    required this.title,
    required this.content,
    required this.uniqueId,
    required this.createdTime,
  });

  MyNotes copy({
    int? id,
    bool? pin,
    bool? isArchive,
    bool? isDeleted,
    String? title,
    String? content,
    String? uniqueId,
    DateTime? createdTime,
  }) {
    return MyNotes(
        id: id ?? this.id,
        pin: pin ?? this.pin,
        isArchive: isArchive ?? this.isArchive,
        isDeleted: isDeleted ?? this.isDeleted,
        title: title ?? this.title,
        content: content ?? this.content,
        uniqueId: uniqueId ?? this.uniqueId,
        createdTime: createdTime ?? this.createdTime);
  }

  static MyNotes fromJson(Map<String, Object?> json) {
    return MyNotes(
        id: json[MyNotesImp.id] as int?,
        pin: json[MyNotesImp.pin] == 1,
        isArchive: json[MyNotesImp.isArchive] == 1,
        isDeleted: json[MyNotesImp.isDeleted] == 1,
        title: json[MyNotesImp.title] as String,
        content: json[MyNotesImp.content] as String,
        uniqueId: json[MyNotesImp.uniqueId] as String,
        createdTime: DateTime.parse(json[MyNotesImp.createdTime] as String));
  }

  Map<String, Object?> toJson() {
    return {
      MyNotesImp.id: id,
      MyNotesImp.id: id,
      MyNotesImp.pin: pin ? 1 : 0,
      MyNotesImp.isArchive: isArchive ? 1 : 0,
      MyNotesImp.isDeleted: isDeleted ? 1 : 0,
      MyNotesImp.title: title,
      MyNotesImp.content: content,
      MyNotesImp.uniqueId: uniqueId,
      MyNotesImp.createdTime: createdTime.toIso8601String()
    };
  }
}
