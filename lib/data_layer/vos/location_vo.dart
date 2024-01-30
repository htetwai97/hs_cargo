class LocationVO {
  int? id;
  String? name;

  LocationVO({this.name,this.id});

  LocationVO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}