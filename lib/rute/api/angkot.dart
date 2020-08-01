class ListAngkot {
  List<RuteAngkot> ruteAngkot;

  ListAngkot({this.ruteAngkot});

  ListAngkot.fromJson(Map<String, dynamic> json) {
    if (json['rute_angkot'] != null) {
      ruteAngkot = new List<RuteAngkot>();
      json['rute_angkot'].forEach((v) {
        ruteAngkot.add(new RuteAngkot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ruteAngkot != null) {
      data['rute_angkot'] = this.ruteAngkot.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RuteAngkot {
  int id;
  String trayek;
  String nomorAngkot;
  String lintasan;
  String gambarUrl;

  RuteAngkot(
      {this.id, this.trayek, this.nomorAngkot, this.lintasan, this.gambarUrl});

  RuteAngkot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trayek = json['trayek'];
    nomorAngkot = json['nomor_angkot'];
    lintasan = json['lintasan'];
    gambarUrl = json['gambar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trayek'] = this.trayek;
    data['nomor_angkot'] = this.nomorAngkot;
    data['lintasan'] = this.lintasan;
    data['gambar_url'] = this.gambarUrl;
    return data;
  }
}
