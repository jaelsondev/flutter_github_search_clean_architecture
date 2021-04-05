import 'dart:convert';

import 'package:github_search_clean/modules/search/domain/entinties/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  final int id;
  final String avatarUrl;

  ResultSearchModel({this.login, this.id, this.avatarUrl});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatarUrl,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      login: map['login'],
      id: map['id'],
      avatarUrl: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
