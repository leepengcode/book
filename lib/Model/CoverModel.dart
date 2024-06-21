import 'dart:convert';

class Cover {
  final String header;
  final String info;
  final String? bank;
  final String? branch;
  final String? ownership;
  var image;
  final String ownername;
  final String deeptitle;
  final String? location;
  final String? street;
  final String cityorprovince;
  final String communeorkhan;
  final String districtorsankat;
  final String villageorphum;
  final String reportto;
  final String date;

  Cover({
    required this.header,
    required this.info,
    this.bank,
    this.branch,
    this.ownership,
    this.image,
    required this.ownername,
    required this.deeptitle,
    this.location,
    this.street,
    required this.cityorprovince,
    required this.communeorkhan,
    required this.districtorsankat,
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
      image: json['image'] ?? '',
      ownername: json['ownername'] ?? '',
      deeptitle: json['deeptitle'] ?? '',
      location: json['location'] ?? '',
      street: json['street'] ?? '',
      cityorprovince: json['cityorprovince'] ?? '',
      communeorkhan: json['communeorkhan'] ?? '',
      districtorsankat: json['districtorsankat'] ?? '',
      villageorphum: json['villageorphum'] ?? '',
      reportto: json['reportto'] ?? '',
      date: json['date'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'header': header,
      'info': info,
      'bank': bank,
      'branch': branch,
      'ownership': ownership,
      'image': image,
      'ownername': ownername,
      'deeptitle': deeptitle,
      'location': location,
      'street': street,
      'cityorprovince': cityorprovince,
      'communeorkhan': communeorkhan,
      'districtorsankat': districtorsankat,
      'villageorphum': villageorphum,
      'reportto': reportto,
      'date': date,
    };
  }
}
