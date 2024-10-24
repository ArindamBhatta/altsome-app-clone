class ModelThree {
  String? error;
  List<Data>? data;

  ModelThree({this.error, this.data});

  ModelThree.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? n;
  int? i;
  double? apc;
  int? mc;
  double? mcc;
  int? v;
  double? d;
  String? tg;
  double? tgc;
  int? g;
  int? gp;
  int? l;
  int? lp;

  Data(
      {this.n,
      this.i,
      this.apc,
      this.mc,
      this.mcc,
      this.v,
      this.d,
      this.tg,
      this.tgc,
      this.g,
      this.gp,
      this.l,
      this.lp});

  Data.fromJson(Map<String, dynamic> json) {
    n = json['n'];
    i = json['i'];
    apc = json['apc'] is int ? (json['apc'] as int).toDouble() : json['apc'];
    mc = json['mc'];
    mcc = json['mcc'] is int ? (json['mcc'] as int).toDouble() : json['mcc'];
    v = json['v'];
    d = json['d'] is int ? (json['d'] as int).toDouble() : json['d'];
    tg = json['tg'];
    tgc = json['tgc'] is int ? (json['tgc'] as int).toDouble() : json['tgc'];
    g = json['g'];
    gp = json['gp'];
    l = json['l'];
    lp = json['lp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['n'] = this.n;
    data['i'] = this.i;
    data['apc'] = this.apc;
    data['mc'] = this.mc;
    data['mcc'] = this.mcc;
    data['v'] = this.v;
    data['d'] = this.d;
    data['tg'] = this.tg;
    data['tgc'] = this.tgc;
    data['g'] = this.g;
    data['gp'] = this.gp;
    data['l'] = this.l;
    data['lp'] = this.lp;
    return data;
  }
}
