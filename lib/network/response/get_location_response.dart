import 'package:hs_cargo_customer_app/data_layer/vos/location_vo.dart';

class GetLocationsResponse {
  bool? error;
  String? message;
  List<LocationVO>? data;

  GetLocationsResponse({this.error, this.message, this.data});

  GetLocationsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LocationVO>[];
      json['data'].forEach((v) {
        data!.add(new LocationVO.fromJson(v));
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

