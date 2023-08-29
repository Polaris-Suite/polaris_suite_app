class TestcaseModel {
  List<Testcases>? testcases;

  TestcaseModel({this.testcases});

  TestcaseModel.fromJson(Map<String, dynamic> json) {
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
  String? linkedProject;
  String? environment;
  List<Null>? comments;
  List<Null>? testRuns;
  List<Null>? testSchema;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Testcases(
      {this.sId,
      this.name,
      this.description,
      this.creatorId,
      this.status,
      this.type,
      this.linkedProject,
      this.environment,
      this.comments,
      this.testRuns,
      this.testSchema,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Testcases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    creatorId = json['creatorId'];
    status = json['status'];
    type = json['type'];
    linkedProject = json['linkedProject'];
    environment = json['environment'];
    if (json['comments'] != null) {
      comments = <Null>[];
      json['comments'].forEach((v) {
        // comments!.add(new Null.fromJson(v));
      });
    }
    if (json['testRuns'] != null) {
      testRuns = <Null>[];
      json['testRuns'].forEach((v) {
        // testRuns!.add(new Null.fromJson(v));
      });
    }
    if (json['testSchema'] != null) {
      testSchema = <Null>[];
      json['testSchema'].forEach((v) {
        // testSchema!.add(new Null.fromJson(v));
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
    data['creatorId'] = this.creatorId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['linkedProject'] = this.linkedProject;
    data['environment'] = this.environment;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) {}).toList();
    }
    if (this.testRuns != null) {
      data['testRuns'] = this.testRuns!.map((v) {}).toList();
    }
    if (this.testSchema != null) {
      data['testSchema'] = this.testSchema!.map((v) => {}).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
