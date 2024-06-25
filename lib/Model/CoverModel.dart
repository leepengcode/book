import 'dart:convert';
import 'dart:io';

class Cover {
  late final String header;
  late final String info;
  late final String? bank;
  late final String? branch;
  late final String? ownership;
  File image;
  late final String ownername;
  late final String deeptitle;
  late final String? location;
  late final String? street;
  late final String cityorprovince;
  late final String communeorkhan;
  late final String districtorsangkat;
  final String villageorphum;
  late final String reportto;
  late final String date;

  Cover({
    required this.header,
    required this.info,
    this.bank,
    this.branch,
    this.ownership,
    required this.image,
    required this.ownername,
    required this.deeptitle,
    this.location,
    this.street,
    required this.cityorprovince,
    required this.communeorkhan,
    required this.districtorsangkat,
    required this.villageorphum,
    required this.reportto,
    required this.date,
  });
  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      header: json['header'] ?? '',
      info: json['info'] ?? '',
      bank: json['bank'] ?? '',
      branch: json['branch'] ?? '',
      ownership: json['ownership'] ?? '',
      image: json['image'],
      ownername: json['ownername'] ?? '',
      deeptitle: json['deeptitle'] ?? '',
      location: json['location'] ?? '',
      street: json['street'] ?? '',
      cityorprovince: json['cityorprovince'] ?? '',
      communeorkhan: json['communeorkhan'] ?? '',
      districtorsangkat: json['districtorsangkat'] ?? '',
      villageorphum: json['villageorphum'] ?? '',
      reportto: json['reportto'] ?? '',
      date: json['date'] ?? '',
    );
  }
  Map<dynamic, dynamic> toJson() {
    return {
      'header': header,
      'info': info,
      'bank': bank,
      'branch': branch,
      'ownership': ownership,
      // 'image': image,
      'ownername': ownername,
      'deeptitle': deeptitle,
      'location': location,
      'street': street,
      'cityorprovince': cityorprovince,
      'communeorkhan': communeorkhan,
      'districtorsangkat': districtorsangkat,
      'villageorphum': villageorphum,
      'reportto': reportto,
      'date': date,
    };
  }
}
