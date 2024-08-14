class PLand {
  final String? no;
  final String? size_sqm;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

  PLand({
    this.no,
    this.size_sqm,
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
  factory PLand.fromJson(Map<String, dynamic> json) {
    return PLand(
        no: json['no'].toString() ?? "",
        size_sqm: json['size_sqm'].toString() ?? "",
        minsqm: json['minsqm'].toString() ?? "",
        maxsqm: json['maxsqm'].toString() ?? "",
        totalmin: json['totalmin'].toString() ?? "",
        totalmax: json['totalmax'].toString() ?? "");
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'size_sqm': size_sqm,
      'minsqm': minsqm,
      'maxsqm': maxsqm,
      'totalmin': totalmin,
      'totalmax': totalmax,
    };
  }
}
