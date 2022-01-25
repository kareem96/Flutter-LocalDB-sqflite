

import 'dart:convert';

class FormsModel{
  int? id;
  String? fullName;
  String? nickName;
  String? gender;
  String? telp;
  String? email;
  String? address;
  String? job;

  FormsModel({
    this.id,
    this.fullName,
    this.nickName,
    this.gender,
    this.telp,
    this.email,
    this.address,
    this.job
  });

  factory FormsModel.fromJson(Map<String, dynamic> json) => FormsModel(
    id: json['id'] ?? 0,
    fullName: json['fullName'] ?? '',
    nickName: json['nickName'] ?? '',
    gender: json['gender'] ?? '',
    telp: json['telp'] ?? '',
    email: json['email'] ?? '',
    address: json['address'] ?? '',
    job: json['job'] ?? '',
  );

  Map<String, dynamic> toJson() => {
      'fullName': fullName ?? '',
      'nickName': nickName ?? '',
      'gender': gender ?? '',
      'telp': telp ?? '',
      'email': email ?? '',
      'address': address ?? '',
      'job': job ?? '',
    };

  FormsModel copy({
    int? id,
    String? fullName,
    String? nickName,
    String? gender,
    String? telp,
    String? email,
    String? address,
    String? job,
  }) => FormsModel(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    nickName: nickName ?? this.nickName,
    gender: gender ?? this.gender,
    telp: telp ?? this.telp,
    email: email ?? this.email,
    address: address ?? this.address,
    job: job ?? this.job,
  );
}


List<FormsModel> formsFromJson(String str) => List<FormsModel>.from(json.decode(str).map((x) => FormsModel.fromJson(x)));
String formToJson(List<FormsModel> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));