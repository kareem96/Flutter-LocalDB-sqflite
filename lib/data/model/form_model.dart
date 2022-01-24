



class FormModel{
  int? id;
  String? fullName;
  String? nickName;
  int? telp;
  String? email;
  String? gender;
  String? address;
  String? job;

  FormModel({
    this.id,
    this.fullName,
    this.nickName,
    this.telp,
    this.email,
    this.gender,
    this.address,
    this.job
  });

  factory FormModel.fromDatabaseJson(Map<String, dynamic> json) => FormModel(
    id: json['id'] ?? 0,
    fullName: json['fullName'] ?? '',
    nickName: json['nickName'] ?? '',
    telp: json['telp'] ?? 0,
    email: json['email'] ?? '',
    address: json['address'] ?? '',
    job: json['job'] ?? '',
  );

  Map<String, dynamic> toJson(){
    var map = {
      'fullName': this.fullName ?? '',
      'nickName': this.nickName ?? '',
      'telp': this.telp ?? '',
      'email': this.email ?? '',
      'address': this.address ?? '',
      'job': this.job ?? '',
    };
    if(map['id']  != null)map['id'] = this.id ?? '';
    return map;
  }
}