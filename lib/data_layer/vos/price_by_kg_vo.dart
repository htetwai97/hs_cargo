class PriceByKgVO {
  int? id;
  int? packageID;
  String? fromCityName;
  String? toCityName;
  int? minKg;
  int? maxKg;
  int? perKgPrice;
  String? currency;

  PriceByKgVO(
      {this.id,
        this.packageID,
        this.fromCityName,
        this.toCityName,
        this.minKg,
        this.maxKg,
        this.perKgPrice,
        this.currency});

  PriceByKgVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageID = json['package_id'];
    fromCityName = json['from_city_name'];
    toCityName = json['to_city_name'];
    minKg = json['min_kg'];
    maxKg = json['max_kg'];
    perKgPrice = json['per_kg_price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageID;
    data['from_city_name'] = this.fromCityName;
    data['to_city_name'] = this.toCityName;
    data['min_kg'] = this.minKg;
    data['max_kg'] = this.maxKg;
    data['per_kg_price'] = this.perKgPrice;
    data['currency'] = this.currency;
    return data;
  }
}