// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// karşılayacak hepsini kapsayan class

class InfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoModel(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
