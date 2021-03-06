// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  Classifications classifications;
  int latestTimeStamp;
  String pid;
  List<String> selectedLots;
  List<String> selectedOccuspaceLocations;
  List<String> subscribedTopics;
  String ucsdaffiliation;
  String username;

  UserProfileModel({
    this.classifications,
    this.latestTimeStamp,
    this.pid,
    this.selectedLots,
    this.selectedOccuspaceLocations,
    this.subscribedTopics,
    this.ucsdaffiliation,
    this.username,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        classifications: json["classifications"] == null
            ? null
            : Classifications.fromJson(json["classifications"]),
        latestTimeStamp:
            json["latestTimeStamp"] == null ? null : json["latestTimeStamp"],
        pid: json["pid"] == null ? null : json["pid"],
        selectedLots: json["selectedLots"] == null
            ? null
            : List<String>.from(json["selectedLots"].map((x) => x)),
        selectedOccuspaceLocations: json["selectedOccuspaceLocations"] == null
            ? null
            : List<String>.from(
                json["selectedOccuspaceLocations"].map((x) => x)),
        subscribedTopics: json["subscribedTopics"] == null
            ? null
            : List<String>.from(json["subscribedTopics"].map((x) => x)),
        ucsdaffiliation:
            json["ucsdaffiliation"] == null ? null : json["ucsdaffiliation"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "classifications":
            classifications == null ? null : classifications.toJson(),
        "latestTimeStamp": latestTimeStamp == null ? null : latestTimeStamp,
        "pid": pid == null ? null : pid,
        "selectedLots": selectedLots == null
            ? null
            : List<dynamic>.from(selectedLots.map((x) => x)),
        "selectedOccuspaceLocations": selectedOccuspaceLocations == null
            ? null
            : List<dynamic>.from(selectedOccuspaceLocations.map((x) => x)),
        "subscribedTopics": subscribedTopics == null
            ? null
            : List<dynamic>.from(subscribedTopics.map((x) => x)),
        "ucsdaffiliation": ucsdaffiliation == null ? null : ucsdaffiliation,
        "username": username == null ? null : username,
      };
}

class Classifications {
  bool student;

  Classifications({
    this.student,
  });

  factory Classifications.fromJson(Map<String, dynamic> json) =>
      Classifications(
        student: json["student"] == null ? null : json["student"],
      );

  Map<String, dynamic> toJson() => {
        "student": student == null ? null : student,
      };
}
