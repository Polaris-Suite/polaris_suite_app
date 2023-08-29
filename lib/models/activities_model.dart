class ActivitiesModel {
  List<Activities>? activities;

  ActivitiesModel({this.activities});

  ActivitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  String? sId;
  String? name;
  String? description;
  String? type;
  String? link;
  String? status;
  String? projectId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Activities(
      {this.sId,
      this.name,
      this.description,
      this.type,
      this.link,
      this.status,
      this.projectId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Activities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    link = json['link'];
    status = json['status'];
    projectId = json['projectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['link'] = this.link;
    data['status'] = this.status;
    data['projectId'] = this.projectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
