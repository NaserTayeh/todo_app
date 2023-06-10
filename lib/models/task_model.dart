// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_label
import 'dart:convert';

import 'package:flutter/material.dart';

class TaskModel {
  String? title;
  bool? isComplete;
  int? id;
  TaskModel({
    this.title,
    this.isComplete,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isComplete': isComplete,
      'id': id,
    };
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    isComplete = map['isComplete'] == 1 ? true : false;
    id = map['id']?.toInt();
  }
}
