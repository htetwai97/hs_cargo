class TrackingDataVO {
  int? id;
  String? token;
  dynamic trackingNo;
  String? customerName;
  String? customerPhone;
  String? receivePoint;
  String? receiveDate;
  String? dropoffPoint;
  String? remark;
  int? parcelQuantity;
  int? totalWeight;
  // Null? perKgCharges;
  String? packageId;
  int? totalCharges;
  String? receiveStatus;
  String? createdAt;
  String? updatedAt;

  //Null? deletedAt;

  String? customerAddress;
  String? customerStatus;
  String? dropoffStatus;
  String? wayStatus;

  String? mywayStatus;
  String? mywayDate;
  String? customerDate;
  // Null? receiveRemark;
  // Null? dropoffRemark;
  // Null? mywayRemark;
  // Null? customerRemark;

  TrackingDataVO({
    this.id,
    this.token,
    this.trackingNo,
    this.customerName,
    this.customerPhone,
    this.receivePoint,
    this.receiveDate,
    this.dropoffPoint,
    this.parcelQuantity,
    this.packageId,
    this.totalWeight,
    this.totalCharges,
    this.receiveStatus,
    this.createdAt,
    this.updatedAt,
    this.customerAddress,
    this.customerStatus,
    this.dropoffStatus,
    this.wayStatus,
    this.remark,
    this.mywayStatus,
    this.mywayDate,
    this.customerDate,
  });

  TrackingDataVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    trackingNo = json['trackingNo'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    receivePoint = json['receive_point'];
    remark = json['remark'];
    receiveDate = json['receive_date'];
    dropoffPoint = json['dropoff_point'];
    parcelQuantity = json['parcel_quantity'];
    packageId = json['package_id'];
    totalWeight = json['total_weight'];
    totalCharges = json['total_charges'];
    receiveStatus = json['receive_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerAddress = json['customer_address'];
    customerStatus = json['customer_status'];
    dropoffStatus = json['dropoff_status'];
    wayStatus = json['way_status'];
    mywayDate = json['mywayDate'];
    mywayStatus = json['mywayStatus'];
    customerDate = json['customerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['trackingNo'] = this.trackingNo;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['remark'] = this.remark;
    data['receive_point'] = this.receivePoint;
    data['receive_date'] = this.receiveDate;
    data['dropoff_point'] = this.dropoffPoint;
    data['parcel_quantity'] = this.parcelQuantity;
    data['package_id'] = this.packageId;
    data['total_weight'] = this.totalWeight;
    data['total_charges'] = this.totalCharges;
    data['receive_status'] = this.receiveStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['customer_address'] = this.customerAddress;
    data['customer_status'] = this.customerStatus;
    data['dropoff_status'] = this.dropoffStatus;
    data['way_status'] = this.wayStatus;
    data['mywayStatus'] = this.mywayStatus;
    data['mywayDate'] = this.mywayDate;
    data['customerDate'] = this.customerDate;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingDataVO &&
          runtimeType == other.runtimeType &&
          token == other.token;
  @override
  int get hashCode => id.hashCode;
}
