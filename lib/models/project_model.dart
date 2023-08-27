// ignore_for_file: unnecessary_new

class ProjectModel {
  List<Projects>? projects;

  ProjectModel({this.projects});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String? sId;
  String? name;
  String? description;
  String? ownerID;
  List? environments;
  String? status;
  List? members;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Projects(
      {this.sId,
      this.name,
      this.description,
      this.ownerID,
      this.environments,
      this.status,
      this.members,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Projects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    ownerID = json['ownerID'];
    if (json['environments'] != null) {
      environments = <Null>[];
      json['environments'].forEach((v) {});
    }
    status = json['status'];
    if (json['members'] != null) {
      members = <Null>[];
      json['members'].forEach((v) {});
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['ownerID'] = this.ownerID;
    if (this.environments != null) {
      data['environments'] = this.environments!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
