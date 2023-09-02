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
  List<Environments>? environments;
  String? status;
  List<Members>? members;
  String? createdAt;
  String? updatedAt;

  Projects(
      {this.sId,
      this.name,
      this.description,
      this.ownerID,
      this.environments,
      this.status,
      this.members,
      this.createdAt,
      this.updatedAt});

  Projects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    ownerID = json['ownerID'];
    if (json['environments'] != null) {
      environments = <Environments>[];
      json['environments'].forEach((v) {
        environments!.add(new Environments.fromJson(v));
      });
    }
    status = json['status'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}

class Environments {
  String? sId;
  String? name;
  String? description;
  List<Null>? variables;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Environments(
      {this.sId,
      this.name,
      this.description,
      this.variables,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Environments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    if (json['variables'] != null) {
      variables = <Null>[];
      json['variables'].forEach((v) {
        // variables!.add(new Null.fromJson(v));
      });
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
    if (this.variables != null) {
      data['variables'] = this.variables!.map((v) {}).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Members {
  String? email;
  String? role;
  String? status;
  String? sId;

  Members({this.email, this.role, this.status, this.sId});

  Members.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    status = json['status'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['status'] = this.status;
    data['_id'] = this.sId;
    return data;
  }
}
