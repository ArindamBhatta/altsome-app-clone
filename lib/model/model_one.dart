class ModelOne {
  String? key;
  String? error;
  Data? data;

  ModelOne.changeToDartSyntax(Map<String, dynamic> jsonAssign) {
    this.key = jsonAssign['key'] as String? ?? '';
    this.error = jsonAssign['error'] as String? ?? '';
    this.data = jsonAssign['data'] != null
        ? new Data.changeToDartSyntax(jsonAssign['data'])
        : null;
  }

  Map<String, dynamic> jsonReturn() {
    final Map<String, dynamic> data = {};
    data['key'] = this.key;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Mc? mc;
  Mc? v;
  Mc? b;
  Mc? e;
  Fg? fg;
  List<int>? smc;
  List<double>? sv;
  List<double>? sb;
  List<double>? se;

  Data({
    this.mc,
    this.v,
    this.b,
    this.e,
    this.fg,
    this.smc,
    this.sv,
    this.sb,
    this.se,
  });

  Data.changeToDartSyntax(Map<String, dynamic> json) {
    mc = json['mc'] != null ? new Mc.fromJson(json['mc']) : null;
    v = json['v'] != null ? new Mc.fromJson(json['v']) : null;
    b = json['b'] != null ? new Mc.fromJson(json['b']) : null;
    e = json['e'] != null ? new Mc.fromJson(json['e']) : null;
    fg = json['fg'] != null ? new Fg.fromJson(json['fg']) : null;
    smc = json['smc'].cast<int>();
    sv = json['sv'].cast<double>();
    sb = json['sb'].cast<double>();
    se = json['se'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mc != null) {
      data['mc'] = this.mc!.toJson();
    }
    if (this.v != null) {
      data['v'] = this.v!.toJson();
    }
    if (this.b != null) {
      data['b'] = this.b!.toJson();
    }
    if (this.e != null) {
      data['e'] = this.e!.toJson();
    }
    if (this.fg != null) {
      data['fg'] = this.fg!.toJson();
    }
    data['smc'] = this.smc;
    data['sv'] = this.sv;
    data['sb'] = this.sb;
    data['se'] = this.se;
    return data;
  }
}

class Mc {
  String? v;
  String? c;

  Mc({this.v, this.c});

  Mc.fromJson(Map<String, dynamic> json) {
    v = json['v'];
    c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    data['c'] = this.c;
    return data;
  }
}

class Fg {
  int? tv;
  String? tc;
  List<H>? h;

  Fg({this.tv, this.tc, this.h});

  Fg.fromJson(Map<String, dynamic> json) {
    tv = json['tv'];
    tc = json['tc'];
    if (json['h'] != null) {
      h = <H>[];
      json['h'].forEach((v) {
        h!.add(new H.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tv'] = this.tv;
    data['tc'] = this.tc;
    if (this.h != null) {
      data['h'] = this.h!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class H {
  int? v;
  String? c;
  String? t;
  String? cc;

  H.fromJson(Map<String, dynamic> json) {
    this.v = json['v'] as int? ?? 0;
    this.c = json['c'] as String? ?? '';
    this.t = json['t'] as String? ?? '';
    this.cc = json['cc'] as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    data['c'] = this.c;
    data['t'] = this.t;
    data['cc'] = this.cc;
    return data;
  }
}
