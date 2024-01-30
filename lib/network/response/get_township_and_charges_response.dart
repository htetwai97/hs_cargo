import 'package:hs_cargo_customer_app/data_layer/vos/township_and_charges_vo.dart';

class GetTownshipAndChargesResponse {
  bool? error;
  String? message;
  List<TownshipAndChargesVO>? data;

  GetTownshipAndChargesResponse({this.error, this.message, this.data});

  GetTownshipAndChargesResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TownshipAndChargesVO>[];
      json['data'].forEach((v) {
        data!.add(new TownshipAndChargesVO.fromJson(v));
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
