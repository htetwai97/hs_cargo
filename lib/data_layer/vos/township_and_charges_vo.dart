class TownshipAndChargesVO {
  int? id;
  int? charges;
  int? townshipId;
  String? townshipName;
  String? createdAt;
  String? updatedAt;

  TownshipAndChargesVO(
      {this.id,
      this.charges,
      this.townshipId,
      this.townshipName,
      this.createdAt,
      this.updatedAt});

  TownshipAndChargesVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    charges = json['charges'];
    townshipId = json['township_id'];
    townshipName = json['township_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['charges'] = this.charges;
    data['township_id'] = this.townshipId;
    data['township_name'] = this.townshipName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
