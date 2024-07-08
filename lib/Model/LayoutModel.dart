import 'dart:convert';

class Layout {
  var deepimage1;
  var deepimage2;
  var layoutimage;

  Layout({
    this.deepimage1,
    this.deepimage2,
    this.layoutimage,
  });
  factory Layout.fromJson(Map<String, dynamic> json) {
    return Layout(
      deepimage1: json['deepimage1'] ?? '',
      deepimage2: json['deepimage2'] ?? '',
      layoutimage: json['layoutimage'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'deepimage1': deepimage1,
      'deepimage2': deepimage2,
      'layoutimage': layoutimage,
    };
  }
}
