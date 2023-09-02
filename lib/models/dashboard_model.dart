class DashBoardModel {
  Dashboard? dashboard;

  DashBoardModel({this.dashboard});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    dashboard = json['dashboard'] != null ? Dashboard.fromJson(json['dashboard']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (dashboard != null) {
      data['dashboard'] = dashboard!.toJson();
    }
    return data;
  }
}

class Dashboard {
  List<Project>? projects;
  int? totalReports;
  int? totalTestCases;
  Shortcuts? shortcuts;

  Dashboard({this.projects, this.totalReports, this.totalTestCases, this.shortcuts});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects!.add(Project.fromJson(v));
      });
    }
    totalReports = json['totalReports'];
    totalTestCases = json['totalTestCases'];
    shortcuts = json['shortcuts'] != null ? Shortcuts.fromJson(json['shortcuts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    data['totalReports'] = totalReports;
    data['totalTestCases'] = totalTestCases;
    if (shortcuts != null) {
      data['shortcuts'] = shortcuts!.toJson();
    }
    return data;
  }
}

class Project {
  String? sId;
  String? name;
  String? description;
  String? ownerID;
  List<String>? environments;
  String? status;
  List<Member>? members; // Use a List of Members instead of List<Null>
  String? createdAt;
  String? updatedAt;
  int? iV;

  Project(
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

  Project.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    ownerID = json['ownerID'];
    environments = List<String>.from(json['environments']);
    status = json['status'];
    if (json['members'] != null) {
      members = <Member>[];
      json['members'].forEach((v) {
        members!.add(Member.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['ownerID'] = ownerID;
    data['environments'] = environments;
    data['status'] = status;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Member {
  // Define member fields here based on your JSON structure
  // For example:
  late String memberId;
  late String memberName;

  Member.fromJson(Map<String, dynamic> json) {
    // Initialize member fields based on json data
    // For example:
    memberId = json['id'];
    memberName = json['name'];
  }

  Map<String, dynamic> toJson() {
    // Convert member fields to JSON format if needed
    // For example:
    return {
      'id': memberId,
      'name': memberName,
    };
  }
}

class Shortcuts {
  String? sId;
  String? userId;
  List<Null>? shortcuts; // This field might need to be modified
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
      json['shortcuts'].forEach((v) {
        shortcuts!.add(Member.fromJson(v) as Null); // Use Member class here if applicable
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['userId'] = userId;
    if (shortcuts != null) {
      data['shortcuts'] = shortcuts!.map((v) {}).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
