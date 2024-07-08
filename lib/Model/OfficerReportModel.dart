// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:book/Model/ComparisonModel.dart';
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;
class OfficerReport {
  late String? condition;
  late String? immediate;
  late String? strength;
  late String? weakness;
  late String? opportunity;
  late String? threat;
  late String? markrtprice;
  List? comparison;
  OfficerReport({
     this.condition,
     this.immediate,
     this.strength,
     this.weakness,
     this.opportunity,
     this.threat,
     this.markrtprice,
    this.comparison,
=======

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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      'comparisons': comparison
    };
  }
  Future InsertOfficer(OfficerReport objOfficer) async {
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insert-officer'));
    

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
      print(await response.stream.bytesToString());
    } else {
      print("${response.reasonPhrase}\n");
      print(await response.stream.bytesToString());
    }
  }
=======
      'comparison': comparison
    };
  }
>>>>>>> Stashed changes
}
