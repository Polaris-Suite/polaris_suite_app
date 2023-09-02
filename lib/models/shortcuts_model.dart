class ShortcutsModel {
  List<Shortcuts>? shortcuts;

  ShortcutsModel({this.shortcuts});

  ShortcutsModel.fromJson(Map<String, dynamic> json) {
    if (json['shortcuts'] != null) {
      shortcuts = <Shortcuts>[];
      json['shortcuts'].forEach((v) {
        shortcuts!.add(new Shortcuts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shortcuts != null) {
      data['shortcuts'] = this.shortcuts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shortcuts {
  String? sId;
  String? userId;
  List<Null>? shortcuts;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Shortcuts(
      {this.sId, this.userId, this.shortcuts, this.createdAt, this.updatedAt, this.iV});

  Shortcuts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    if (json['shortcuts'] != null) {
      shortcuts = <Null>[];
      json['shortcuts'].forEach((v) {});
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.shortcuts != null) {
      data['shortcuts'] = this.shortcuts!.map((v) {}).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
