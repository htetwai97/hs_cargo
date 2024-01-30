class OrderRegisterVO {
  String? customerName;
  String? customerPhone;
  int? receivePoint;
  int? dropoffPoint;
  String? receiveDate;
  String? remark;
  int? parcelQuantity;
  int? totalWeight;
  int? perKgCharges;
  int? packageId;
  int? totalCharges;
  String? customerAddress;
  String? myawadyDate;
  String? customerDate;
  String? token;
  String? trackingNo;
  int? pickupFlag;
  int? townshipChargesId;
  String? pickupAddress;
  String? pickupContact;
  String? pickupPhone;
  int? pickupCharges;
  int? totalChargesPickup;
  String? pickupDate;
  String? pickupTime;

  OrderRegisterVO(
      {this.customerName,
      this.customerPhone,
      this.receivePoint,
      this.dropoffPoint,
      this.receiveDate,
      this.remark,
      this.parcelQuantity,
      this.totalWeight,
      this.perKgCharges,
      this.packageId,
      this.totalCharges,
      this.customerAddress,
      this.myawadyDate,
      this.customerDate,
      this.token,
      this.trackingNo,
      this.pickupFlag,
      this.townshipChargesId,
      this.pickupAddress,
      this.pickupContact,
      this.pickupPhone,
      this.pickupCharges,
      this.totalChargesPickup,
      this.pickupDate,
      this.pickupTime});

  OrderRegisterVO.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    receivePoint = json['receive_point'];
    dropoffPoint = json['dropoff_point'];
    receiveDate = json['receive_data'];
    remark = json['remark'];
    parcelQuantity = json['parcel_quantity'];
    totalWeight = json['total_weight'];
    perKgCharges = json['per_kg_charges'];
    packageId = json['package_id'];
    totalCharges = json['total_charges'];
    customerAddress = json['customer_address'];
    myawadyDate = json['myawady_date'];
    customerDate = json['customer_date'];
    token = json['token'];
    trackingNo = json['tracking_no'];
    pickupFlag = json['pickup_flag'];
    townshipChargesId = json['township_charges_id'];
    pickupAddress = json['pickup_address'];
    pickupContact = json['pickup_contact'];
    pickupPhone = json['pickup_phone'];
    pickupCharges = json['pickup_charges'];
    totalChargesPickup = json['total_charges_pickup'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['receive_point'] = this.receivePoint;
    data['dropoff_point'] = this.dropoffPoint;
    data['receive_data'] = this.receiveDate;
    data['remark'] = this.remark;
    data['parcel_quantity'] = this.parcelQuantity;
    data['total_weight'] = this.totalWeight;
    data['per_kg_charges'] = this.perKgCharges;
    data['package_id'] = this.packageId;
    data['total_charges'] = this.totalCharges;
    data['customer_address'] = this.customerAddress;
    data['myawady_date'] = this.myawadyDate;
    data['customer_date'] = this.customerDate;
    data['token'] = this.token;
    data['tracking_no'] = this.trackingNo;
    data['pickup_flag'] = this.pickupFlag;
    data['township_charges_id'] = this.townshipChargesId;
    data['pickup_address'] = this.pickupAddress;
    data['pickup_contact'] = this.pickupContact;
    data['pickup_phone'] = this.pickupPhone;
    data['pickup_charges'] = this.pickupCharges;
    data['total_charges_pickup'] = this.totalChargesPickup;
    data['pickup_date'] = this.pickupDate;
    data['pickup_time'] = this.pickupTime;
    return data;
  }
}
