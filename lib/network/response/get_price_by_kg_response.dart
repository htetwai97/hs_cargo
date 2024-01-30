import 'package:hs_cargo_customer_app/data_layer/vos/price_by_kg_vo.dart';

class GetPriceByKGResponse {
  bool? error;
  String? message;
  List<PriceByKgVO>? data;

  GetPriceByKGResponse({this.error, this.message, this.data});

  GetPriceByKGResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PriceByKgVO>[];
      json['data'].forEach((v) {
        data!.add(new PriceByKgVO.fromJson(v));
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
