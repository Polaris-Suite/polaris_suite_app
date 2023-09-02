class Testcase {
  List<Testcases>? testcases;

  Testcase({this.testcases});

  Testcase.fromJson(Map<String, dynamic> json) {
    if (json['testcases'] != null) {
      testcases = <Testcases>[];
      json['testcases'].forEach((v) {
        testcases!.add(new Testcases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.testcases != null) {
      data['testcases'] = this.testcases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Testcases {
  String? sId;
  String? name;
  String? description;
  String? creatorId;
  String? status;
  String? type;
  LinkedProject? linkedProject;
  Environment? environment;
  List<Comments>? comments;

  Testcases(
      {this.sId,
      this.name,
      this.description,
      this.creatorId,
      this.status,
      this.type,
      this.linkedProject,
      this.environment,
      this.comments});

  Testcases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    creatorId = json['creatorId'];
    status = json['status'];
    type = json['type'];
    linkedProject = json['linkedProject'] != null
        ? new LinkedProject.fromJson(json['linkedProject'])
        : null;
    environment = json['environment'] != null
        ? new Environment.fromJson(json['environment'])
        : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['creatorId'] = this.creatorId;
    data['status'] = this.status;
    data['type'] = this.type;
    if (this.linkedProject != null) {
      data['linkedProject'] = this.linkedProject!.toJson();
    }
    if (this.environment != null) {
      data['environment'] = this.environment!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinkedProject {
  String? repo;
  String? sId;
  String? name;
  String? description;
  String? ownerID;
  List<String>? environments;
  String? status;
  List<Null>? members;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LinkedProject(
      {this.repo,
      this.sId,
      this.name,
      this.description,
      this.ownerID,
      this.environments,
      this.status,
      this.members,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LinkedProject.fromJson(Map<String, dynamic> json) {
    repo = json['repo'];
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    ownerID = json['ownerID'];
    environments = json['environments'].cast<String>();
    status = json['status'];
    if (json['members'] != null) {
      members = <Null>[];
      json['members'].forEach((v) {
        // members!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repo'] = this.repo;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['ownerID'] = this.ownerID;
    data['environments'] = this.environments;
    data['status'] = this.status;
    if (this.members != null) {
      data['members'] = this.members!.map((v) {}).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Environment {
  String? sId;
  String? name;
  String? description;
  List<Null>? variables;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Environment(
      {this.sId,
      this.name,
      this.description,
      this.variables,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Environment.fromJson(Map<String, dynamic> json) {
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

class Comments {
  String? sId;
  String? comment;
  UserId? userId;
  List<Null>? replies;
  List<Null>? likes;
  String? createdAt;

  Comments(
      {this.sId, this.comment, this.userId, this.replies, this.likes, this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    comment = json['comment'];
    userId = json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    if (json['replies'] != null) {
      replies = <Null>[];
      json['replies'].forEach((v) {
        // replies!.add(new Null.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Null>[];
      json['likes'].forEach((v) {
        // likes!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['comment'] = this.comment;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) {}).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) {}).toList();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  String? password;
  bool? isEmailVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserId(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.isEmailVerified,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isEmailVerified = json['isEmailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isEmailVerified'] = this.isEmailVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
