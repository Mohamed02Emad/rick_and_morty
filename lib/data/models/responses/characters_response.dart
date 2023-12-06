import 'package:rick_and_morty/data/models/character.dart';

class CharactersResponse {
  Info? _info;
  List<Character>? _results;

  CharactersResponse({Info? info, List<Character>? results}) {
    if (info != null) {
      _info = info;
    }
    if (results != null) {
      _results = results;
    }
  }

  Info? get info => _info;

  set info(Info? info) => _info = info;

  List<Character>? get results => _results;

  set results(List<Character>? results) => _results = results;

  CharactersResponse.fromJson(Map<String, dynamic> json) {
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      _results = <Character>[];
      json['results'].forEach((v) {
        _results!.add(Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (_info != null) {
      data['info'] = _info!.toJson();
    }
    if (_results != null) {
      data['results'] = _results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? _count;
  int? _pages;
  String? _next;
  String? _prev;

  Info({int? count, int? pages, String? next, String? prev}) {
    if (count != null) {
      _count = count;
    }
    if (pages != null) {
      _pages = pages;
    }
    if (next != null) {
      _next = next;
    }
    if (prev != null) {
      _prev = prev;
    }
  }

  int? get count => _count;

  set count(int? count) => _count = count;

  int? get pages => _pages;

  set pages(int? pages) => _pages = pages;

  String? get next => _next;

  set next(String? next) => _next = next;

  String? get prev => _prev;

  set prev(String? prev) => _prev = prev;

  Info.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['count'] = _count;
    data['pages'] = _pages;
    data['next'] = _next;
    data['prev'] = _prev;
    return data;
  }
}
