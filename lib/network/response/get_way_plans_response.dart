class GetWayPlansResponse {
  bool? error;
  String? message;
  List<WayPlanData>? data;

  GetWayPlansResponse({this.error, this.message, this.data});

  GetWayPlansResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WayPlanData>[];
      json['data'].forEach((v) {
        data!.add(new WayPlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WayPlanData {
  int? id;
  String? wayNo;
  String? date;
  int? riderName;
  String? rider;
  String? startTime;
  String? endTime;
  int? totalOrder;
  String? createdAt;
  String? updatedAt;
  List<WayPlannings>? wayPlannings;

  WayPlanData(
      {this.id,
      this.wayNo,
      this.date,
      this.riderName,
      this.rider,
      this.startTime,
      this.endTime,
      this.totalOrder,
      this.createdAt,
      this.updatedAt,
      this.wayPlannings});

  WayPlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wayNo = json['way_no'];
    date = json['date'];
    riderName = json['rider_name'];
    rider = json['rider'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    totalOrder = json['total_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['way_plannings'] != null) {
      wayPlannings = <WayPlannings>[];
      json['way_plannings'].forEach((v) {
        wayPlannings!.add(new WayPlannings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['way_no'] = this.wayNo;
    data['date'] = this.date;
    data['rider_name'] = this.riderName;
    data['rider'] = this.rider;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['total_order'] = this.totalOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.wayPlannings != null) {
      data['way_plannings'] =
          this.wayPlannings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WayPlannings {
  int? id;
  String? wayPlanNo;
  int? riderName;
  String? date;
  String? startTime;
  String? routeName;
  String? createdAt;
  String? updatedAt;
  String? endTime;
  int? wayId;
  String? remark;
  int? wayPlanScheduleId;
  WayPlanSchedule? wayPlanSchedule;

  WayPlannings(
      {this.id,
      this.wayPlanNo,
      this.riderName,
      this.date,
      this.startTime,
      this.routeName,
      this.createdAt,
      this.updatedAt,
      this.endTime,
      this.wayId,
      this.remark,
      this.wayPlanScheduleId,
      this.wayPlanSchedule});

  WayPlannings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wayPlanNo = json['wayplan_no'];
    riderName = json['rider_name'];
    date = json['date'];
    startTime = json['start_time'];
    routeName = json['route_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    endTime = json['end_time'];
    wayId = json['way_id'];
    remark = json['remark'];
    wayPlanScheduleId = json['way_plan_schedule_id'];
    wayPlanSchedule = json['way_plan_schedule'] != null
        ? new WayPlanSchedule.fromJson(json['way_plan_schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wayplan_no'] = this.wayPlanNo;
    data['rider_name'] = this.riderName;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['route_name'] = this.routeName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['end_time'] = this.endTime;
    data['way_id'] = this.wayId;
    data['remark'] = this.remark;
    data['way_plan_schedule_id'] = this.wayPlanScheduleId;
    if (this.wayPlanSchedule != null) {
      data['way_plan_schedule'] = this.wayPlanSchedule!.toJson();
    }
    return data;
  }
}

class WayPlanSchedule {
  int? id;
  String? token;
  // Null? trackingNo;
  String? customerName;
  String? customerPhone;
  int? receivePoint;
  String? receiveDate;
  int? dropoffPoint;
  // Null? dropoffDate;
  // Null? remark;
  int? parcelQuantity;
  // Null? totalWeight;
  // Null? perKgCharges;
  int? packageId;
  int? totalCharges;
  int? receiveStatus;
  int? dropoffStatus;
  int? wayStatus;
  // Null? riderId;
  String? createdAt;
  String? updatedAt;
  // Null? deletedAt;
  String? customerAddress;
  int? customerStatus;
  int? myawadyStatus;
  // Null? myawadyDate;
  // Null? customerDate;
  // Null? receiveRemark;
  // Null? dropoffRemark;
  // Null? myawadyRemark;
  // Null? customerRemark;
  int? rejectStatus;
  // Null? rejectDate;
  // Null? registerDate;
  // Null? rejectRemark;
  int? wayPlanningFlag;
  int? wayPlanningId;
  int? pickupFlag;
  // Null? townshipChargesId;
  // Null? pickupAddress;
  // Null? pickupContact;
  // Null? pickupPhone;
  // Null? pickupCharges;
  // Null? totalChargesPickup;
  // Null? pickupDate;
  // Null? pickupTime;

  WayPlanSchedule({
    this.id,
    this.token,
    // this.trackingNo,
    this.customerName,
    this.customerPhone,
    this.receivePoint,
    this.receiveDate,
    this.dropoffPoint,
    // this.dropoffDate,
    // this.remark,
    this.parcelQuantity,
    // this.totalWeight,
    // this.perKgCharges,
    this.packageId,
    this.totalCharges,
    this.receiveStatus,
    this.dropoffStatus,
    this.wayStatus,
    // this.riderId,
    this.createdAt,
    this.updatedAt,
    // this.deletedAt,
    this.customerAddress,
    this.customerStatus,
    this.myawadyStatus,
    // this.myawadyDate,
    // this.customerDate,
    // this.receiveRemark,
    // this.dropoffRemark,
    // this.myawadyRemark,
    // this.customerRemark,
    this.rejectStatus,
    // this.rejectDate,
    // this.registerDate,
    // this.rejectRemark,
    this.wayPlanningFlag,
    this.wayPlanningId,
    this.pickupFlag,
    // this.townshipChargesId,
    // this.pickupAddress,
    // this.pickupContact,
    // this.pickupPhone,
    // this.pickupCharges,
    // this.totalChargesPickup,
    // this.pickupDate,
    // this.pickupTime,
  });

  WayPlanSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    // trackingNo = json['tracking_no'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    receivePoint = json['receive_point'];
    receiveDate = json['receive_date'];
    dropoffPoint = json['dropoff_point'];
    //  dropoffDate = json['dropoff_date'];
    // remark = json['remark'];
    parcelQuantity = json['parcel_quantity'];
    // totalWeight = json['total_weight'];
    // perKgCharges = json['per_kg_charges'];
    packageId = json['package_id'];
    totalCharges = json['total_charges'];
    receiveStatus = json['receive_status'];
    dropoffStatus = json['dropoff_status'];
    wayStatus = json['way_status'];
    // riderId = json['rider_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    customerAddress = json['customer_address'];
    customerStatus = json['customer_status'];
    myawadyStatus = json['myawady_status'];
    //  myawadyDate = json['myawady_date'];
    //  customerDate = json['customer_date'];
    //  receiveRemark = json['receive_remark'];
    //  dropoffRemark = json['dropoff_remark'];
    //  myawadyRemark = json['myawady_remark'];
    //  customerRemark = json['customer_remark'];
    rejectStatus = json['reject_status'];
    //  rejectDate = json['reject_date'];
    //  registerDate = json['register_date'];
    //  rejectRemark = json['reject_remark'];
    wayPlanningFlag = json['wayplanning_flag'];
    wayPlanningId = json['way_planning_id'];
    pickupFlag = json['pickup_flag'];
    // townshipChargesId = json['township_charges_id'];
    // pickupAddress = json['pickup_address'];
    // pickupContact = json['pickup_contact'];
    // pickupPhone = json['pickup_phone'];
    // pickupCharges = json['pickup_charges'];
    // totalChargesPickup = json['total_charges_pickup'];
    // pickupDate = json['pickup_date'];
    // pickupTime = json['pickup_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    //  data['tracking_no'] = this.trackingNo;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['receive_point'] = this.receivePoint;
    data['receive_date'] = this.receiveDate;
    data['dropoff_point'] = this.dropoffPoint;
    // data['dropoff_date'] = this.dropoffDate;
    //  data['remark'] = this.remark;
    data['parcel_quantity'] = this.parcelQuantity;
    // data['total_weight'] = this.totalWeight;
    // data['per_kg_charges'] = this.perKgCharges;
    data['package_id'] = this.packageId;
    data['total_charges'] = this.totalCharges;
    data['receive_status'] = this.receiveStatus;
    data['dropoff_status'] = this.dropoffStatus;
    data['way_status'] = this.wayStatus;
    // data['rider_id'] = this.riderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    data['customer_address'] = this.customerAddress;
    data['customer_status'] = this.customerStatus;
    data['myawady_status'] = this.myawadyStatus;
    // data['myawady_date'] = this.myawadyDate;
    // data['customer_date'] = this.customerDate;
    // data['receive_remark'] = this.receiveRemark;
    // data['dropoff_remark'] = this.dropoffRemark;
    // data['myawady_remark'] = this.myawadyRemark;
    // data['customer_remark'] = this.customerRemark;
    data['reject_status'] = this.rejectStatus;
    // data['reject_date'] = this.rejectDate;
    // data['register_date'] = this.registerDate;
    // data['reject_remark'] = this.rejectRemark;
    data['wayplanning_flag'] = this.wayPlanningFlag;
    data['way_planning_id'] = this.wayPlanningId;
    data['pickup_flag'] = this.pickupFlag;
    // data['township_charges_id'] = this.townshipChargesId;
    // data['pickup_address'] = this.pickupAddress;
    // data['pickup_contact'] = this.pickupContact;
    // data['pickup_phone'] = this.pickupPhone;
    // data['pickup_charges'] = this.pickupCharges;
    // data['total_charges_pickup'] = this.totalChargesPickup;
    // data['pickup_date'] = this.pickupDate;
    // data['pickup_time'] = this.pickupTime;
    return data;
  }
}
