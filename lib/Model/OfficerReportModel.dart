// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:book/Model/ComparisonModel.dart';

class OfficerReport {
  final String condition;
  final String immediate;
  final String strength;
  final String weakness;
  final String opportunity;
  final String threat;
  final String markrtprice;
  final List<Comparison> comparison;
  OfficerReport({
    required this.condition,
    required this.immediate,
    required this.strength,
    required this.weakness,
    required this.opportunity,
    required this.threat,
    required this.markrtprice,
    required this.comparison,
  });
  factory OfficerReport.fromJson(Map<String, dynamic> json) {
    return OfficerReport(
        condition: json['condition'] ?? '',
        immediate: json['immediate'] ?? '',
        strength: json['strength'] ?? '',
        weakness: json['weakness'] ?? '',
        opportunity: json['opportunity'] ?? '',
        threat: json['threat'] ?? '',
        markrtprice: json['markrtprice'] ?? '',
        comparison: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'condition': condition,
      'immediate': immediate,
      'strength': strength,
      'weakness': weakness,
      'opportunity': opportunity,
      'threat': threat,
      'markrtprice': markrtprice,
      'comparison': comparison
    };
  }
}
