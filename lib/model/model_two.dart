class ModelTwo {
  var key;
  var error;
  var data;

  ModelTwo.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
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
  var tt;
  var tr;
  var tg;
  var tl;
  var rt;
  var details;

  Data.fromJson(Map<String, dynamic> json) {
    tt = json['tt'];
    tr = json['tr'];
    tg = json['tg'];
    tl = json['tl'];
    rt = json['rt'];

    if (json['details'] != null) {
      details = (json['details'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, Detail.fromJson(value)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tt'] = this.tt;
    data['tr'] = this.tr;
    data['tg'] = this.tg;
    data['tl'] = this.tl;
    data['rt'] = this.rt;
    if (this.details != null) {
      data['details'] =
          this.details!.map((key, value) => MapEntry(key, value.toJson()));
    }
    return data;
  }
}

class Detail {
  var id;
  var sg;
  var s;
  var n;
  var ms;
  var cs;
  var ts;
  var p;
  var mc;
  var r;
  var p1;
  var p7;
  var p30;
  var v;
  var fdv;
  var o;
  var h;
  var l;
  var mcp;
  var vp;
  var sl;

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sg = json['sg'];
    s = json['s'];
    n = json['n'];
    ms = json['ms'];
    cs = json['cs'];
    ts = json['ts'];
    p = json['p'];
    mc = json['mc'];
    r = json['r'];

    p1 = (json['p1'] is int) ? json['p1'] : (json['p1'] as num?)?.toInt();
    p7 = (json['p7'] is int) ? json['p7'] : (json['p7'] as num?)?.toInt();
    p30 = (json['p30'] is int) ? json['p30'] : (json['p30'] as num?)?.toInt();

    v = json['v'];
    fdv = json['fdv'];
    o = json['o'];
    h = json['h'];
    l = json['l'];

    mcp = (json['mcp'] is int) ? json['mcp'] : (json['mcp'] as num?)?.toInt();

    vp = json['vp'];
    sl = (json['sl'] as List?)?.map((e) => (e as num).toDouble()).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['sg'] = this.sg;
    data['s'] = this.s;
    data['n'] = this.n;
    data['ms'] = this.ms;
    data['cs'] = this.cs;
    data['ts'] = this.ts;
    data['p'] = this.p;
    data['mc'] = this.mc;
    data['r'] = this.r;
    data['p1'] = this.p1;
    data['p7'] = this.p7;
    data['p30'] = this.p30;
    data['v'] = this.v;
    data['fdv'] = this.fdv;
    data['o'] = this.o;
    data['h'] = this.h;
    data['l'] = this.l;
    data['mcp'] = this.mcp;
    data['vp'] = this.vp;
    data['sl'] = this.sl;
    return data;
  }
}
