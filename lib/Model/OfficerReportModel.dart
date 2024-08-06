// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:book/Model/ComparisonModel.dart';
import 'package:http/http.dart' as http;

class OfficerReport {
  late String? condition;
  late String? immediate;
  late String? strength;
  late String? weakness;
  late String? opportunity;
  late String? threat;
  late String? markrtprice;
  List<Comparison>? comparison = [];
  OfficerReport({
    this.condition,
    this.immediate,
    this.strength,
    this.weakness,
    this.opportunity,
    this.threat,
    this.markrtprice,
    this.comparison,
  });
  factory OfficerReport.fromJson(Map<String, dynamic> json) {
    return OfficerReport(
        condition: json['condition'] ?? '',
        immediate: json['immediate'] ?? '',
        strength: json['strength'] ?? '',
        weakness: json['weakness'] ?? '',
        opportunity: json['opportunity'] ?? '',
        threat: json['threat'] ?? '',
        markrtprice: json['markrtprice'] ?? '');
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
      'comparisons': comparison
    };
  }

  Future InsertOfficer(OfficerReport objOfficer, var id_book) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insert-officer/${id_book}'));

    request.body = jsonEncode({
      'condition': objOfficer.condition,
      'immediate': objOfficer.immediate,
      'strength': objOfficer.strength,
      'weakness': objOfficer.weakness,
      'opportunity': objOfficer.opportunity,
      'threat': objOfficer.threat,
      'markrtprice': objOfficer.markrtprice,
      'comparisons': objOfficer.comparison?.toList(),
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in InsertOfficer");
    } else {
      print("${response.reasonPhrase}\n");
      print(await response.stream.bytesToString());
    }
  }
}
